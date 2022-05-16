//
//  ClearButtonType.swift
//  Pods-Roatlas_Example
//
//  Created by Daniel Gogozan on 22.04.2022.
//

import Foundation

public enum ClearButtonType {
    case never
    case whileEditing
    case untilEditing
    case always
    
    func visibility(dependingOn state: ROSearchView.State) -> Bool {
        switch self {
        case .never:
            return false
        case .whileEditing:
            switch state {
            case .none, .endEditing:
                return false
            case .editing, .noResults, .onResults:
                return true
            }
        case .untilEditing:
            switch state {
            case .none, .endEditing:
                return true
            case .editing, .onResults, .noResults:
                return false
            }
        case .always:
            return true
        }
    }
}
