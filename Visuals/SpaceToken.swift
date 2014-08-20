//
//  SpaceToken.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

protocol SpaceToken {
    func append(itemToken: ItemToken) -> ItemToken
}

@infix func - (lhs: SpaceToken, rhs: ItemToken) -> ItemToken {
    return lhs.append(rhs)
}

@infix func - (lhs: SpaceToken, rhs: View[]) -> ItemToken {
    return lhs-Item(view: rhs[0])
}

@infix func - (lhs: SpaceToken, rhs: Item[]) -> ItemToken {
    return lhs-rhs[0]
}
