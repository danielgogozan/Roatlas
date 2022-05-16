//
//  ATSearchView.swift
//  Roatlas
//
//  Created by Daniel Gogozan on 15.04.2022.
//

import UIKit

// MARK: - ROSearch View
public class ROSearchView: UIView {
    
    enum State: Int, CaseIterable {
        case none
        case editing
        case endEditing
        case noResults
        case onResults
        
        func shouldShowClearButton(using clearButtonType: ClearButtonType?) -> Bool {
            clearButtonType?.visibility(dependingOn: self) ?? false
        }
    }
    
    // MARK: - Private properties
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var contentsLayer: UIView!
    @IBOutlet private weak var contentStackView: UIStackView!
    @IBOutlet private weak var searchStackView: UIStackView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var clearImageView: UIImageView!
    @IBOutlet private weak var clearImageStackView: UIStackView!
    @IBOutlet private weak var searchResultView: ROSearchResultView!
    @IBOutlet private weak var separatorView: UIView!
    @IBOutlet private weak var heightSeparatorView: NSLayoutConstraint!
    
    private let settlementRepository: SettlementRepository
    private var settlementHasBeenPicked = false
    private var style: ROSearchViewStyle = ROSearchViewStyle()
    
    private var state: State = .none {
        didSet {
            clearImageStackView.isHidden = !state.shouldShowClearButton(using: style.clearButtonType)
        }
    }
    
    private var isExpanded = false {
        didSet {
            updateBasedOnExpanded()
        }
    }
    
    // MARK: - Public API & properties
    public weak var delegate: ROSearchViewDelegate?
    
    public override init(frame: CGRect) {
        settlementRepository = SettlementRepository()
        super.init(frame: frame)
        loadFromNib()
    }
    
    public required init?(coder: NSCoder) {
        settlementRepository = SettlementRepository()
        super.init(coder: coder)
        loadFromNib()
    }
    
    public func customize(using style: ROSearchViewStyle) {
        self.style = style
        state = .none
        separatorView.backgroundColor = style.separatorColor
        heightSeparatorView.constant = style.separatorHeight
        textField.font = style.searchFont
        textField.textColor = style.searchTextColor
        textField.placeholder = style.searchPlaceholder
        
        if let clearImage = style.clearImage {
            clearImageView.image = clearImage
        }
        if let placeholderAttributedString = style.placeholderAttributedString {
            textField.attributedPlaceholder = placeholderAttributedString
        }
        
        searchResultView.customize(using: style.resultViewStyle)
        updateBasedOnExpanded()
    }
}

// MARK: - Private API
private extension ROSearchView {
    func loadFromNib() {
        let bundle = Bundle(for: ROSearchView.self)
        bundle.loadNibNamed(String(describing: ROSearchView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentsLayer.layer.masksToBounds = true
        
        searchResultView.isHidden = true
        searchResultView.delegate = self
        textField.delegate = self
        
        clearImageStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clearButtonTapped(_:))))
        
        searchResultView.customize(using: style.resultViewStyle)
    }
    
    func search(key: String) {
        let result = settlementRepository.find(by: key)
        searchResultView.refresh(with: result)
        searchResultView.isHidden = result.isEmpty
        
        // prevent setting the same value
        if result.isEmpty && isExpanded {
            isExpanded = false
        } else if !result.isEmpty && !isExpanded {
            isExpanded = true
        }
        
        state = result.isEmpty ? .noResults : .onResults
    }
    
    func updateBasedOnExpanded() {
        if isExpanded {
            contentView.apply(style: style.expandedStyle)
            contentsLayer.layer.cornerRadius = style.expandedStyle?.cornerRadius ?? 0.0
            separatorView.isHidden = false
        } else {
            contentView.apply(style: style.searchViewStyle)
            contentsLayer.layer.cornerRadius = style.searchViewStyle?.cornerRadius ?? 0.0
            searchResultView.isHidden = true
            separatorView.isHidden = true
        }
    }
    
    @objc
    func clearButtonTapped(_ sender: Any) {
        textField.text = ""
        isExpanded = false
        textField.becomeFirstResponder()
    }
}

// MARK: - Text Field Delegate
extension ROSearchView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text,
              let textRange = Range(range, in: text) else { return true }
        
        settlementHasBeenPicked = false
        let updatedText = text.replacingCharacters(in: textRange, with: string)
        Debouncer.input(updatedText, comparedAgainst: textField.text ?? "") { [weak self] _ in
            self?.search(key: updatedText)
        }
        
        return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        state = .editing
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if !settlementHasBeenPicked {
            textField.text = ""
        }
        isExpanded = false
        state = .endEditing
    }
}

// MARK: - Delegate
extension ROSearchView: ROSearchResultDelegate {
    func didSelectResult(_ settlement: Settlement) {
        textField.text = settlement.name
        settlementHasBeenPicked = true
        isExpanded = false
    }
}

public protocol ROSearchViewDelegate: AnyObject {
    func didSelectResult(settlement: Settlement)
}
