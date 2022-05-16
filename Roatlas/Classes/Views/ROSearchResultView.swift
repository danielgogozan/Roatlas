//
//  ATSearchResultView.swift
//  Roatlas
//
//  Created by Daniel Gogozan on 16.04.2022.
//

import Foundation
import UIKit

protocol ROSearchResultDelegate: AnyObject {
    func didSelectResult(_ settlement: Settlement)
}

class ROSearchResultView: UIView {
    // MARK: - Private properties
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var settlementsTableView: UITableView!
    @IBOutlet private weak var topConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var trailingConstraint: NSLayoutConstraint!
    
    private var heightConstraint: NSLayoutConstraint!
    private var settlements: [Settlement] = []
    private var style: ROResultStyle!
    
    // MARK: - Public properties
    weak var delegate: ROSearchResultDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    // MARK: - Public API
    func refresh(with settlements: [Settlement]) {
        self.settlements = settlements
        settlementsTableView.reloadData()
        updateHeightConstraintIfNeeded()
    }
    
    func settlement(at index: Int) -> Settlement? {
        guard index >= 0, index < settlements.count else { return nil }
        return settlements[index]
    }
    
    func customize(using style: ROResultStyle) {
        self.style = style
        settlementsTableView.separatorColor = style.separatorColor
        settlementsTableView.backgroundColor = style.backgroundColor
    }
}

// MARK: - Private API
private extension ROSearchResultView {
    func loadFromNib() {
        let bundle = Bundle(for: ROSearchResultView.self)
        bundle.loadNibNamed(String(describing: ROSearchResultView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.backgroundColor = .clear
        
        setupTableView()
    }
    
    func setupTableView() {
        settlementsTableView.backgroundColor = .red
        settlementsTableView.dataSource = self
        settlementsTableView.delegate = self
        settlementsTableView.register(UINib(nibName: String(describing: SettlementCell.self),bundle: Bundle(for: SettlementCell.self)),
                                      forCellReuseIdentifier: SettlementCell.reuseIdentifier)
        
    }
    
    func updateHeightConstraintIfNeeded() {
        var height = style.maxViewHeight
        if settlementsTableView.contentSize.height < style.maxViewHeight {
            height = settlementsTableView.contentSize.height + topConstraint.constant
        }
        
        if heightConstraint != nil {
            contentView.removeConstraint(heightConstraint)
        }
        heightConstraint = contentView.heightAnchor.constraint(equalToConstant: height)
        heightConstraint.isActive = true
    }
}

// MARK: - Table View Data Source
extension ROSearchResultView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settlements.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettlementCell.reuseIdentifier, for: indexPath) as? SettlementCell,
              let settlement = settlement(at: indexPath.row)
        else {
            return UITableViewCell()
        }
        cell.setup(settlement: settlement, resultType: style.type)
        cell.font = style.font
        cell.textColor = style.textColor
        cell.seletedTextColor = style.selectedTextColor
        cell.backgroundColor = .clear
        
        let selectionView = UIView()
        selectionView.clipsToBounds = true
        selectionView.backgroundColor = style.selectionColor
        cell.selectedBackgroundView = selectionView
        cell.clipsToBounds = true
        
        return cell
    }
}

// MARK: - Table View Delegate
extension ROSearchResultView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SettlementCell,
              let settlement = cell.settlement else { return }
        cell.textColor = style.selectedTextColor
        delegate?.didSelectResult(settlement)
    }
}
