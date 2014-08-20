//
//  SpaceFromSuperview.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct SpaceFromSuperview: SpaceToken {
    let space: Space
    
    func append(itemToken: ItemToken) -> ItemToken {
        let relation = Relation(lhs: Item(view: itemToken.firstItem.view.superview), rhs: itemToken.firstItem, space: space)
        return Container(relations: [relation] + itemToken.relations)
    }
}

// Glued item

@prefix func | (itemToken: ItemToken) -> ItemToken {
    let spaceFromSuperview = SpaceFromSuperview(space: Space(value: 0))
    return spaceFromSuperview.append(itemToken)
}

@prefix func | (enclosedView: View[]) -> ItemToken {
    return |Item(view: enclosedView[0])
}

@prefix func | (enclosedItem: Item[]) -> ItemToken {
    return |enclosedItem[0]
}

// Item

@prefix func |- (itemToken: ItemToken) -> ItemToken {
    let spaceFromSuperview = SpaceFromSuperview(space: Relation.defaultSuperviewSpace())
    return spaceFromSuperview.append(itemToken)
}

@prefix func |- (enclosedView: View[]) -> ItemToken {
    return |-Item(view: enclosedView[0])
}

@prefix func |- (enclosedItem: Item[]) -> ItemToken {
    return |-enclosedItem[0]
}

// Space

@prefix func |- (space: Space) -> SpaceFromSuperview {
    return SpaceFromSuperview(space: space)
}

@prefix func |- (space: Int) -> SpaceFromSuperview {
    return |-Space(value: CGFloat(space))
}

@prefix func |- (space: Float) -> SpaceFromSuperview {
    return |-Space(value: CGFloat(space))
}

@prefix func |- (space: Double) -> SpaceFromSuperview {
    return |-Space(value: CGFloat(space))
}

@prefix func |- (space: SpaceCondition) -> SpaceFromSuperview {
    return |-Space(conditions: [space])
}

@prefix func |- (space: (SpaceCondition, SpaceCondition)) -> SpaceFromSuperview {
    return |-Space(conditions: [space.0, space.1])
}

@prefix func |- (space: (SpaceCondition, SpaceCondition, SpaceCondition)) -> SpaceFromSuperview {
    return |-Space(conditions: [space.0, space.1, space.2])
}

@prefix func |- (space: SpaceCondition[]) -> SpaceFromSuperview {
    return |-Space(conditions: space)
}
