//
//  ROViewStyle.swift
//  Pods-Roatlas_Example
//
//  Created by Daniel Gogozan on 22.04.2022.
//

import Foundation

public struct ROViewStyle {
    public var backgroundColor: UIColor?
    public var cornerRadius: CGFloat = 0.0
    public var borderWidth: CGFloat = 0.0
    public var borderColor: UIColor?
    public var shadowOffset: CGSize?
    public var shadowOpacity: CGFloat?
    public var shadowRadius: CGFloat?
    public var shadowColor: UIColor?
    
    public init() { }
    
    public init(backgroundColor: UIColor? = nil,
                cornerRadius: CGFloat = 0.0,
                borderWidth: CGFloat = 0.0,
                borderColor: UIColor? = nil,
                shadowOffset: CGSize? = nil,
                shadowOpacity: CGFloat? = nil,
                shadowRadius: CGFloat? = nil,
                shadowColor: UIColor? = nil) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
        self.shadowColor = shadowColor
    }
}

public struct ROResultStyle {
    public var backgroundColor: UIColor? = .white
    public var separatorColor: UIColor? = .lightGray
    public var selectionColor: UIColor? = .lightGray
    public var type: ResultType = .settlementAndCounty
    public var font: UIFont? = .systemFont(ofSize: 16)
    public var textColor: UIColor = .black
    public var selectedTextColor: UIColor?
    public var maxViewHeight: CGFloat = 200
    
    public init() { }
    
    public init(backgroundColor: UIColor? = .white,
                separatorColor: UIColor? = .lightGray,
                selectionColor: UIColor? = .lightGray,
                type: ResultType = .settlementAndCounty,
                font: UIFont? = .systemFont(ofSize: 16),
                textColor: UIColor = .black,
                selectedTextColor: UIColor? = nil,
                maxViewHeight: CGFloat = 200) {
        self.backgroundColor = backgroundColor
        self.separatorColor = separatorColor
        self.selectionColor = selectionColor
        self.type = type
        self.font = font
        self.textColor = textColor
        self.selectedTextColor = selectedTextColor
        self.maxViewHeight = maxViewHeight
    }
}
