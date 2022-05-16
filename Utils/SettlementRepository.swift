import Foundation
import SwiftCSV

class SettlementRepository {
    private(set) var settlements: [Settlement] = []
    private let separator = ","
    
    init() {
        settlements = getAll()
    }
    
    // MARK: - Public API
    func find(by key: String) -> [Settlement] {
        return settlements.filter { $0.name.lowercased().starts(with: key.lowercased())}
    }
}

// MARK: - Private API
private extension SettlementRepository {
    func getAll() -> [Settlement] {
        guard let fileUrl = getFileUrl() else { return [] }
        
        do {
            let csvFile = try CSV(url: fileUrl)
            csvFile.enumeratedRows.forEach { rowData in
                let settlement = Settlement(name: rowData[2],
                                            county: rowData[3],
                                            latitude: Double(rowData[1]) ?? 0,
                                            longitude: Double(rowData[0]) ?? 0,
                                            countryAbbreviation: rowData[4],
                                            region: rowData[6],
                                            population: Double(rowData[5]) ?? 0)
                settlements.append(settlement)
                
            }
            return settlements
        } catch {
            print("[Internal error] Could not access localities data.")
        }
        return []
    }
    
    func getFileUrl() -> URL? {
        let customBundle = Bundle(for: SettlementRepository.self)
        guard let resourceURL = customBundle.resourceURL?.appendingPathComponent("Roatlas.bundle")
        else {
            print("Resource url not found.")
            return nil
        }
        
        guard let resourceBundle = Bundle(url: resourceURL)
        else {
            print("Bundle not found.")
            return nil
        }
        
        guard let fileURL = resourceBundle.url(forResource: "localities", withExtension: "csv")
        else {
            print("File not found.")
            return nil
        }
        
        return fileURL
    }
}
