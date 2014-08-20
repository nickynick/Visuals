//
//  ConstraintGenerator.swift
//  Visuals
//
//  Created by Nick Tymchenko on 06/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import Foundation

class ConstraintGenerator {
    var axis: Axis
    var options: NSLayoutFormatOptions

    init(axis: Axis = .Horizontal, options: NSLayoutFormatOptions = .DirectionLeadingToTrailing) {
        self.axis = axis
        self.options = options
    }
    
    func generateRelationConstraints(relation: Relation) -> NSLayoutConstraint[] {
        var constraints = relation.space.conditions.map({
            (spaceCondition: SpaceCondition) -> NSLayoutConstraint in
            
            let rhsAttribute = relation.rhs.view != relation.lhs.view.superview ?
                self.leadingAttribute() : self.trailingAttribute()
            let lhsAttribute = relation.lhs.view != relation.rhs.view.superview ?
                self.trailingAttribute() : self.leadingAttribute()
            
            return NSLayoutConstraint(
                item: relation.rhs.view,
                attribute: rhsAttribute,
                relatedBy: spaceCondition.relation,
                toItem: relation.lhs.view,
                attribute: lhsAttribute,
                multiplier: 1,
                constant: spaceCondition.value)
            })
        
        if let alignmentAttribute = self.alignmentAttribute() {
            if (relation.lhs.view != relation.rhs.view.superview &&
                relation.rhs.view != relation.lhs.view.superview)
            {
                let alignmentConstraint = NSLayoutConstraint(
                    item: relation.lhs.view,
                    attribute: alignmentAttribute,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: relation.rhs.view,
                    attribute: alignmentAttribute,
                    multiplier: 1,
                    constant: 0)
                
                constraints.append(alignmentConstraint)
            }
        }
        
        return constraints
    }
    
    func generateItemConstraints(item: Item) -> NSLayoutConstraint[] {
        if let size = item.size {
            return size.conditions.map({
                (condition: Condition) -> NSLayoutConstraint in
                NSLayoutConstraint(
                    item: item.view,
                    attribute: self.sizeAttribute(),
                    relatedBy: condition.relation,
                    toItem: condition.view,
                    attribute: condition.view == nil ? .NotAnAttribute : self.sizeAttribute(),
                    multiplier: 1,
                    constant: condition.constant)
                })
        } else {
            return []
        }
    }
    
    // Private stuff
    
    func leadingAttribute() -> NSLayoutAttribute {
        let direction = self.options & .DirectionMask
        
        switch self.axis {
        case .Horizontal:
            switch direction {
            case NSLayoutFormatOptions.DirectionLeftToRight:
                return .Left
            case NSLayoutFormatOptions.DirectionRightToLeft:
                return .Right
            default:
                return .Leading
            }
        case .Vertical:
            switch direction {
            case NSLayoutFormatOptions.DirectionRightToLeft:
                return .Bottom
            default:
                return .Top
            }
        }
    }
    
    func trailingAttribute() -> NSLayoutAttribute {
        switch self.leadingAttribute() {
        case .Top:
            return .Bottom
        case .Left:
            return .Right
        case .Bottom:
            return .Top
        case .Right:
            return .Left
        case .Leading:
            return .Trailing
        case .Trailing:
            return .Leading
        default:
            return .NotAnAttribute
        }
    }
    
    func sizeAttribute() -> NSLayoutAttribute {
        switch self.axis {
        case .Horizontal:
            return .Width
        case .Vertical:
            return .Height
        }
    }
    
    func alignmentAttribute() -> NSLayoutAttribute? {
        let alignment = self.options & .AlignmentMask
        
        // TODO: only allow to pick available attributes for the given Axis
        
        switch alignment {
        case NSLayoutFormatOptions.AlignAllLeft:
            return NSLayoutAttribute.Left
        case NSLayoutFormatOptions.AlignAllRight:
            return NSLayoutAttribute.Right
        case NSLayoutFormatOptions.AlignAllTop:
            return NSLayoutAttribute.Top
        case NSLayoutFormatOptions.AlignAllBottom:
            return NSLayoutAttribute.Bottom
        case NSLayoutFormatOptions.AlignAllLeading:
            return NSLayoutAttribute.Leading
        case NSLayoutFormatOptions.AlignAllTrailing:
            return NSLayoutAttribute.Trailing
        case NSLayoutFormatOptions.AlignAllCenterX:
            return NSLayoutAttribute.CenterX
        case NSLayoutFormatOptions.AlignAllCenterY:
            return NSLayoutAttribute.CenterY
        case NSLayoutFormatOptions.AlignAllBaseline:
            return NSLayoutAttribute.Baseline
        case NSLayoutFormatOptions.AlignAllLastBaseline:
            return NSLayoutAttribute.Baseline // TODO: is it the correct one?
        case NSLayoutFormatOptions.AlignAllFirstBaseline:
            return NSLayoutAttribute.FirstBaseline
        default:
            return nil
        }
    }
}