//
//  SpaceToSuperview.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct SpaceToSuperview {
    let space: Space
}

// Glued item

@postfix func | (itemToken: ItemToken) -> ItemToken {
    let spaceToSuperview = SpaceToSuperview(space: Space(value: 0))
    return itemToken - spaceToSuperview
}

@postfix func | (enclosedView: View[]) -> ItemToken {
    return Item(view: enclosedView[0])|
}

@postfix func | (enclosedItem: Item[]) -> ItemToken {
    return enclosedItem[0]|
}

// Item

@postfix func -| (itemToken: ItemToken) -> ItemToken {
    let spaceToSuperview = SpaceToSuperview(space: Relation.defaultSuperviewSpace())
    return itemToken - spaceToSuperview
}

@postfix func -| (enclosedView: View[]) -> ItemToken {
    return Item(view: enclosedView[0])-|
}

@postfix func -| (enclosedItem: Item[]) -> ItemToken {
    return enclosedItem[0]-|
}

// Space

@postfix func -| (space: Space) -> SpaceToSuperview {
    return SpaceToSuperview(space: space)
}

@postfix func -| (space: Int) -> SpaceToSuperview {
    return Space(value: CGFloat(space))-|
}

@postfix func -| (space: Float) -> SpaceToSuperview {
    return Space(value: CGFloat(space))-|
}

@postfix func -| (space: Double) -> SpaceToSuperview {
    return Space(value: CGFloat(space))-|
}

@postfix func -| (space: SpaceCondition) -> SpaceToSuperview {
    return Space(conditions: [space])-|
}

@postfix func -| (space: (SpaceCondition, SpaceCondition)) -> SpaceToSuperview {
    return Space(conditions: [space.0, space.1])-|
}

@postfix func -| (space: (SpaceCondition, SpaceCondition, SpaceCondition)) -> SpaceToSuperview {
    return Space(conditions: [space.0, space.1, space.2])-|
}

@postfix func -| (space: SpaceCondition[]) -> SpaceToSuperview {
    return Space(conditions: space)-|
}
