//
//  View.swift
//  Visuals
//
//  Created by Nick Tymchenko on 05/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    typealias View = UIView
#else
    import AppKit
    typealias View = NSView
#endif
