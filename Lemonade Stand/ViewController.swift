//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by David Aragon on 10/18/14.
//  Copyright (c) 2014 David Aragon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var customers:[Customer] = []
    var accountBalance:Double = 10.00
    var lemonsCount = 1
    var iceCount = 1
    var lemonsInRecipeCount = 1
    var iceInRecipeCount = 1
    var recipeRatio:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for (var i = 0; i<10; i++) {
            customers.append(Customer())
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

