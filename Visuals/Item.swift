//
//  Item.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct Item: ItemToken {
    let view: View
    let size: Size?
    
    init(view: View, size: Size? = nil) {
        self.view = view
        self.size = size
    }
    
    var firstItem: Item { return self }
    var lastItem: Item { return self }
    var relations: Relation[] { return [] }
    
    func append(space: Space) -> SpaceToken {
        return SpaceFromItem(item: self, space: space)
    }
    
    func append(space: Space, itemToken: ItemToken) -> ItemToken {
        let relation = Relation(lhs: self, rhs: itemToken.firstItem, space: space)
        return Container(relations: [relation] + itemToken.relations)
    }
}