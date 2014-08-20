//
//  ItemToken.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

protocol ItemToken {
    var firstItem: Item { get }
    var lastItem: Item { get }
    var relations: Relation[] { get }
    
    func append(space: Space) -> SpaceToken
    func append(space: Space, itemToken: ItemToken) -> ItemToken
}

// Item

@infix func - (lhs: ItemToken, rhs: ItemToken) -> ItemToken {
    return lhs.append(Relation.defaultViewSpace(), itemToken: rhs)
}

@infix func - (lhs: ItemToken, rhs: View[]) -> ItemToken {
    return lhs-Item(view: rhs[0])
}

@infix func - (lhs: ItemToken, rhs: Item[]) -> ItemToken {
    return lhs-rhs[0]
}

@infix func - (lhs: ItemToken, rhs: SpaceToSuperview) -> ItemToken {
    let superviewItem = Item(view: lhs.lastItem.view.superview)
    return lhs.append(rhs.space, itemToken: superviewItem) // TODO: fix this?
}

// Space

@infix func - (lhs: ItemToken, rhs: Space) -> SpaceToken {
    return lhs.append(rhs)
}

@infix func - (lhs: ItemToken, rhs: Int) -> SpaceToken {
    return lhs-Space(value: CGFloat(rhs))
}

@infix func - (lhs: ItemToken, rhs: Float) -> SpaceToken {
    return lhs-Space(value: CGFloat(rhs))
}

@infix func - (lhs: ItemToken, rhs: Double) -> SpaceToken {
    return lhs-Space(value: CGFloat(rhs))
}

@infix func - (lhs: ItemToken, rhs: SpaceCondition) -> SpaceToken {
    return lhs-Space(conditions: [rhs])
}

@infix func - (lhs: ItemToken, rhs: (SpaceCondition, SpaceCondition)) -> SpaceToken {
    return lhs-Space(conditions: [rhs.0, rhs.1])
}

@infix func - (lhs: ItemToken, rhs: (SpaceCondition, SpaceCondition, SpaceCondition)) -> SpaceToken {
    return lhs-Space(conditions: [rhs.0, rhs.1, rhs.2])
}

@infix func - (lhs: ItemToken, rhs: SpaceCondition[]) -> SpaceToken {
    return lhs-Space(conditions: rhs)
}


// Item[] - Item

@infix func - (lhs: Item[], rhs: ItemToken) -> ItemToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: View[]) -> ItemToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: Item[]) -> ItemToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: SpaceToSuperview) -> ItemToken {
    return lhs[0]-rhs
}

// Item[] - Space

@infix func - (lhs: Item[], rhs: Space) -> SpaceToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: Int) -> SpaceToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: Float) -> SpaceToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: Double) -> SpaceToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: SpaceCondition) -> SpaceToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: (SpaceCondition, SpaceCondition)) -> SpaceToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: (SpaceCondition, SpaceCondition, SpaceCondition)) -> SpaceToken {
    return lhs[0]-rhs
}

@infix func - (lhs: Item[], rhs: SpaceCondition[]) -> SpaceToken {
    return lhs[0]-rhs
}

// View[] - Item

@infix func - (lhs: View[], rhs: ItemToken) -> ItemToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: View[]) -> ItemToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: Item[]) -> ItemToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: SpaceToSuperview) -> ItemToken {
    return Item(view: lhs[0])-rhs
}

// View[] - Space

@infix func - (lhs: View[], rhs: Space) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: Int) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: Float) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: Double) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: SpaceCondition) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: (SpaceCondition, SpaceCondition)) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: (SpaceCondition, SpaceCondition, SpaceCondition)) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}

@infix func - (lhs: View[], rhs: SpaceCondition[]) -> SpaceToken {
    return Item(view: lhs[0])-rhs
}
