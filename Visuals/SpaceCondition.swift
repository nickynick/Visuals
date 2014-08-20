//
//  SpaceCondition.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct SpaceCondition: Condition {
    let value: CGFloat
    let relation: NSLayoutRelation
    let priority: Int = 1000
    
    var view: View? { return nil }
    var constant: CGFloat { return self.value }
    
    init(value: CGFloat, relation: NSLayoutRelation, priority: Int = 1000) {
        self.value = value
        self.relation = relation
        self.priority = priority
    }
}

// ==

@prefix func == (value: Int) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .Equal)
}

@prefix func == (value: Float) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .Equal)
}

@prefix func == (value: Double) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .Equal)
}

@prefix func == (view: View) -> ViewCondition {
    return ViewCondition(view: view, relation: .Equal)
}

// >=

@prefix func >= (value: Int) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .GreaterThanOrEqual)
}

@prefix func >= (value: Float) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .GreaterThanOrEqual)
}

@prefix func >= (value: Double) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .GreaterThanOrEqual)
}

@prefix func >= (view: View) -> ViewCondition {
    return ViewCondition(view: view, relation: .GreaterThanOrEqual)
}

// <=

@prefix func <= (value: Int) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .LessThanOrEqual)
}

@prefix func <= (value: Float) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .LessThanOrEqual)
}

@prefix func <= (value: Double) -> SpaceCondition {
    return SpaceCondition(value: CGFloat(value), relation: .LessThanOrEqual)
}

@prefix func <= (view: View) -> ViewCondition {
    return ViewCondition(view: view, relation: .LessThanOrEqual)
}

// Priority

@infix func | (lhs: SpaceCondition, rhs: Int) -> SpaceCondition {
    return SpaceCondition(value: lhs.value, relation: lhs.relation, priority: rhs)
}

@infix func | (lhs: ViewCondition, rhs: Int) -> ViewCondition {
    return ViewCondition(view: lhs.view!, relation: lhs.relation, priority: rhs)
}

// View -> Item

@infix func | (lhs: View, rhs: Int) -> Item {
    return Item(view: lhs, size: Size(value: CGFloat(rhs)))
}

@infix func | (lhs: View, rhs: Float) -> Item {
    return Item(view: lhs, size: Size(value: CGFloat(rhs)))
}

@infix func | (lhs: View, rhs: Double) -> Item {
    return Item(view: lhs, size: Size(value: CGFloat(rhs)))
}

@infix func | (lhs: View, rhs: View) -> Item {
    return Item(view: lhs, size: Size(conditions: [==rhs]))
}

@infix func | (lhs: View, rhs: Condition) -> Item {
    return Item(view: lhs, size: Size(conditions: [rhs]))
}

@infix func | (lhs: View, rhs: (Condition, Condition)) -> Item {
    return Item(view: lhs, size: Size(conditions: [rhs.0, rhs.1]))
}

@infix func | (lhs: View, rhs: (Condition, Condition, Condition)) -> Item {
    return Item(view: lhs, size: Size(conditions: [rhs.0, rhs.1, rhs.2]))
}

