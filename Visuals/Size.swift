//
//  Size.swift
//  Visuals
//
//  Created by Nick Tymchenko on 08/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct Size {
    let conditions: Condition[]
    
    init(conditions: Condition[]) {
        self.conditions = conditions
    }
    
    init(value: CGFloat) {
        self.conditions = [SpaceCondition(value: value, relation: NSLayoutRelation.Equal)]
    }
}