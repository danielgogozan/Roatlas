//
//  Debouncer.swift
//  Roatlas
//
//  Created by Daniel Gogozan on 16.04.2022.
//

import Dispatch

/*
 - Used in case the search text field should have a debounce in order to avoid multiple requests
 - Currently using no debounce time
 */
class Debouncer<T: Equatable> {
    private init() {}
    
    static func input(_ input: T, comparedAgainst current: T, debounce: DispatchTime = .now(), perform: @escaping (T) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: debounce) {
            if input != current { perform(input) }
        }
    }
}
