//
//  ROSearchViewStyle.swift
//  Roatlas
//
//  Created by Daniel Gogozan on 26.04.2022.
//

import Foundation

public struct ROSearchViewStyle {
    // MARK: - Base style
    public var searchViewStyle: ROViewStyle?
    public var expandedStyle: ROViewStyle?
    // MARK: - Result related
    public var resultViewStyle: ROResultStyle = ROResultStyle()
    // MARK: - Search related
    public var clearButtonType: ClearButtonType = .whileEditing
    public var clearImage: UIImage?
    public var separatorHeight: CGFloat = 1.0
    public var separatorColor: UIColor = .lightGray
    public var searchFont: UIFont? = .systemFont(ofSize: 16)
    public var searchTextColor: UIColor = .black
    public var searchPlaceholder: String = "Alege orasul"
    public var placeholderAttributedString: NSAttributedString?
    
    public init() { }
    
    public init(searchViewStyle: ROViewStyle? = nil,
                expandedStyle: ROViewStyle? = nil,
                resultViewStyle: ROResultStyle = ROResultStyle(),
                clearButtonType: ClearButtonType = .whileEditing,
                clearImage: UIImage? = UIImage(named: "xmark"),
                separatorHeight: CGFloat = 1.0,
                separatorColor: UIColor = .lightGray,
                searchFont: UIFont = .systemFont(ofSize: 16),
                searchTextColor: UIColor = .black,
                searchPlaceholder: String = "Write a few letters...",
                placeholderAttributedString: NSAttributedString? = nil
    ) {
        self.searchViewStyle = searchViewStyle
        self.expandedStyle = expandedStyle
        self.clearButtonType = clearButtonType
        self.clearImage = clearImage
        self.separatorHeight = separatorHeight
        self.separatorColor = separatorColor
        self.searchTextColor = searchTextColor
        self.searchFont = searchFont
        self.resultViewStyle = resultViewStyle
        self.searchPlaceholder = searchPlaceholder
        self.placeholderAttributedString = placeholderAttributedString
    }
}

public enum ResultType {
    case settlement
    case settlementAndCounty
}
