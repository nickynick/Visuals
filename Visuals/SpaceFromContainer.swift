//
//  SpaceFromContainer.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct SpaceFromContainer: SpaceToken {
    let container: Container
    let space: Space
        
    func append(itemToken: ItemToken) -> ItemToken {
        let relation = Relation(lhs: container.lastItem, rhs: itemToken.firstItem, space: space)
        return Container(relations: container.relations + [relation] + itemToken.relations)
    }
}