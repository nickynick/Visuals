//
//  Visuals.swift
//  Visuals
//
//  Created by Nick Tymchenko on 07/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

func Visuals(#H: ItemToken, options: NSLayoutFormatOptions = .DirectionLeadingToTrailing) {
    let installer = ConstraintInstaller()
    installer.install(H.relations, axis: .Horizontal, options: options)
}

func Visuals(#H: Item[], options: NSLayoutFormatOptions = .DirectionLeadingToTrailing) {
    let installer = ConstraintInstaller()
    installer.install(H[0], axis: .Horizontal, options: options)
}

func Visuals(#H: View[], options: NSLayoutFormatOptions = .DirectionLeadingToTrailing) {
    let installer = ConstraintInstaller()
    installer.install(Item(view: H[0]), axis: .Horizontal, options: options)
}

func Visuals(#V: ItemToken, options: NSLayoutFormatOptions = NSLayoutFormatOptions.DirectionLeadingToTrailing) {
    let installer = ConstraintInstaller()
    installer.install(V.relations, axis: .Vertical, options: options)
}

func Visuals(#V: Item[], options: NSLayoutFormatOptions = .DirectionLeadingToTrailing) {
    let installer = ConstraintInstaller()
    installer.install(V[0], axis: .Vertical, options: options)
}

func Visuals(#V: View[], options: NSLayoutFormatOptions = .DirectionLeadingToTrailing) {
    let installer = ConstraintInstaller()
    installer.install(Item(view: V[0]), axis: .Vertical, options: options)
}
