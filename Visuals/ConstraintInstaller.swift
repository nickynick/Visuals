//
//  ConstraintInstaller.swift
//  Visuals
//
//  Created by Nick Tymchenko on 06/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

class ConstraintInstaller {
    func install(relations: Relation[], axis: Axis, options: NSLayoutFormatOptions) {
        let generator = ConstraintGenerator(axis: axis, options: options)
        
        for relation in relations {
            let superview = self.findCommonSuperview(relation.lhs.view, anotherView: relation.rhs.view)
            assert(superview != nil, "Views must have a common superview!")

            let relationConstraints = generator.generateRelationConstraints(relation)
            superview!.addConstraints(relationConstraints)
        }
        
        for item in self.itemsInRelations(relations) {
            self.install(item, axis: axis, options: options)
        }
    }
    
    func install(item: Item, axis: Axis, options: NSLayoutFormatOptions) {
        item.view.setTranslatesAutoresizingMaskIntoConstraints(false)

        let generator = ConstraintGenerator(axis: axis, options: options)
        let viewConstraints = generator.generateItemConstraints(item)
        
        for constraint in viewConstraints {
            let superview = self.findCommonSuperview(item.view, anotherView: constraint.secondItem as? View)
            assert(superview != nil, "Views must have a common superview!")
            
            superview!.addConstraint(constraint)
        }
    }
    
    // Private stuff
    
    func findCommonSuperview(view: View, anotherView: View?) -> View? {
        if anotherView == nil {
            return view
        }
        
        var currentView: View? = view
        while currentView != nil && !anotherView!.isDescendantOfView(currentView) {
            currentView = currentView!.superview
        }
        return currentView
    }
    
    func itemsInRelations(relations: Relation[]) -> Item[] {
        var views = NSMutableSet()
        var items = Item[]()
        
        for relation in relations {
            for item in [relation.lhs, relation.rhs] {
                if (!views.containsObject(item.view)) {
                    views.addObject(item.view)
                    items.append(item)
                }
            }
        }
        
        return items
    }
}