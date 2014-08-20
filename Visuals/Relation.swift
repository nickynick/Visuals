//
//  Relation.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct Relation {
    let lhs: Item
    let rhs: Item
    let space: Space
    
    static func defaultViewSpace() -> Space {
        // TODO: dehardcode
        return Space(value: 8)
    }
    
    static func defaultSuperviewSpace() -> Space {
        // TODO: dehardcode
        return Space(value: 20)
    }
}