//
//  Settlement.swift
//  Roatlas
//
//  Created by Daniel Gogozan on 14.04.2022.
//

import Foundation

public struct Settlement {
    public let name: String
    public let county: String
    public let latitude: Double
    public let longitude: Double
    public let countryAbbreviation: String
    public let region: String
    public let population: Double
    
    func displayName(using resultType: ResultType) -> String {
        switch resultType {
        case .settlement:
            return name
        case .settlementAndCounty:
            return name + ", jud. " + county
        }
    }
}
