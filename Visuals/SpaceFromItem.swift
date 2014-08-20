//
//  SpaceFromItem.swift
//  Visuals
//
//  Created by Nick Tymchenko on 06/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct SpaceFromItem: SpaceToken {
    let item: Item
    let space: Space
        
    func append(itemToken: ItemToken) -> ItemToken {
        let relation = Relation(lhs: item, rhs: itemToken.firstItem, space: space)
        return Container(relations: [relation] + itemToken.relations)
    }
}