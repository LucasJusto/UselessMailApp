//
//  Fields.swift
//  UselessEmailApp
//
//  Created by João Brentano on 30/11/21.
//

import Foundation

enum Fields: Int, Comparable {
    
    static func < (lhs: Fields, rhs: Fields) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case name = 0
    case email
    case phone
    case work
    case company
    case workload

    mutating func next() {
        if let next = Fields(rawValue: rawValue+1) {
            self = next
        }
    }
}
