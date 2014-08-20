//
//  ExampleViewController.swift
//  VisualsExample
//
//  Created by Nick Tymchenko on 06/07/14.
//  Copyright (c) 2014 Nick Tymchenko. All rights reserved.
//

import UIKit
import Visuals

class ExampleViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.greenColor()
        view1.layer.borderColor = UIColor.blackColor().CGColor
        view1.layer.borderWidth = 2
        self.view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.redColor()
        view2.layer.borderColor = UIColor.blackColor().CGColor
        view2.layer.borderWidth = 2
        self.view.addSubview(view2)
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.yellowColor()
        view3.layer.borderColor = UIColor.blackColor().CGColor
        view3.layer.borderWidth = 2
        self.view.addSubview(view3)
        
        Visuals(H: |-[view1|40][view2|75]-(>=50,<=100)-[view3]|)
        
        Visuals(V: |-100-[view1]-250-|)
        Visuals(V: |-50-[view2|view1])
        Visuals(V: [view3|(>=100,<=200)]-150-|)
    }
}
