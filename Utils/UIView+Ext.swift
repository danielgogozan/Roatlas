//
//  UIView+Ext.swift
//  Pods-Roatlas_Example
//
//  Created by Daniel Gogozan on 22.04.2022.
//

import Foundation
import UIKit

extension UIView {
    func apply(style: ROViewStyle?, applyBackgroundColor: Bool = true) {
        guard let style = style else {
            return
        }
        if let bgColor = style.backgroundColor {
            backgroundColor = bgColor
        }
        
        layer.cornerRadius = style.cornerRadius
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor?.cgColor
        
        layer.shadowOpacity = Float(style.shadowOpacity ?? CGFloat(0))
        layer.shadowOffset = style.shadowOffset ?? CGSize(width: 0, height: 0)
        layer.shadowRadius = style.shadowRadius ?? 0.0
        layer.shadowColor = style.shadowColor?.cgColor
    }
}
