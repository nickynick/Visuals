//
//  Space.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct Space {
    let conditions: SpaceCondition[]
    
    init(conditions: SpaceCondition[]) {
        self.conditions = conditions
    }
    
    init(value: CGFloat) {
        self.conditions = [SpaceCondition(value: value, relation: NSLayoutRelation.Equal)]
    }
}