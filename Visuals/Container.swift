//
//  Container.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

struct Container: ItemToken {
    let relations: Relation[]
    
    var firstItem: Item { return self.relations[0].lhs }
    var lastItem: Item { return self.relations[self.relations.count - 1].rhs }
    
    subscript(view: View) -> Container { return self[Item(view: view)] }
    
    subscript(item: Item) -> Container {
        get {
            let relation = Relation(lhs: self.lastItem, rhs: item, space: Space(value: 0))
            return Container(relations: self.relations + [relation])
        }
    }
    
    func append(space: Space) -> SpaceToken {
        return SpaceFromContainer(container: self, space: space)
    }
    
    func append(space: Space, itemToken: ItemToken) -> ItemToken {
        let relation = Relation(lhs: self.lastItem, rhs: itemToken.firstItem, space: space)
        return Container(relations: self.relations + [relation] + itemToken.relations)
    }
}
