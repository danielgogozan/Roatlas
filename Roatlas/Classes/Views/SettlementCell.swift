//
//  SettlementCell.swift
//  Roatlas
//
//  Created by Daniel Gogozan on 16.04.2022.
//

import UIKit

class SettlementCell: UITableViewCell {
    // MARK: - private properties
    @IBOutlet public weak var nameLabel: UILabel!
    private (set) var settlement: Settlement?
    
    // MARK: - Public properties
    static let reuseIdentifier = String(describing: SettlementCell.self)
    var font: UIFont? {
        didSet {
            nameLabel.font = font
        }
    }
    var textColor: UIColor? {
        didSet {
            nameLabel.textColor = textColor
        }
    }
    var seletedTextColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        nameLabel.textColor = seletedTextColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        nameLabel.textColor = textColor
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        nameLabel.textColor = textColor
    }
    
    // MARK: - Public API
    func setup(settlement: Settlement, resultType: ResultType) {
        self.settlement = settlement
        nameLabel.text = settlement.displayName(using: resultType)
    }
}
