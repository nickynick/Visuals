//
//  ViewCondition.swift
//  Visuals
//
//  Created by Nick Tymchenko on 08/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct ViewCondition: Condition {
    let view: View?
    let relation: NSLayoutRelation
    let priority: Int = 1000
    
    var constant: CGFloat { return 0 }
    
    init(view: View, relation: NSLayoutRelation, priority: Int = 1000) {
        self.view = view
        self.relation = relation
        self.priority = priority
    }
}