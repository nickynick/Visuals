//
//  Condition.swift
//  Visuals
//
//  Created by Nick Tymchenko on 08/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

protocol Condition {
    var relation: NSLayoutRelation { get }
    var view: View? { get }
    var constant: CGFloat { get }
    var priority: Int { get }
}