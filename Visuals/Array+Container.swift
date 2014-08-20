//
//  Array+Container.swift
//  Visuals
//
//  Created by Nick Tymchenko on 06/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

extension Array {
    subscript(view: View) -> Container {
        return self[Item(view: view)]
    }
    
    subscript(item: Item) -> Container {
        get {
            switch self[0] {
            case let v as View:
                let relation = Relation(lhs: Item(view: v), rhs: item, space: Space(value: 0))
                return Container(relations: [relation])
            case let i as Item:
                let relation = Relation(lhs: i, rhs: item, space: Space(value: 0))
                return Container(relations: [relation])
            default:
                assert(false, "Expected an array of View or Item")
                return Container(relations: [])
            }
        }
    }
}