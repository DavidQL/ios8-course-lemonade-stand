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
    var lemonsInRecipeCount = 0
    var iceInRecipeCount = 0
    var recipeRatio:CGFloat = 0.0
    
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var lemonsCountLabel: UILabel!
    @IBOutlet weak var iceCountLabel: UILabel!
    @IBOutlet weak var lemonsInRecipeCountLabel: UILabel!
    
    @IBOutlet weak var iceInRecipeCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for (var i = 0; i<10; i++) {
            customers.append(Customer())
        }
        
        updateMainView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyLemonPressed(sender: UIButton) {
        accountBalance -= 2.0
        lemonsCount += 1
        
        updateMainView()
    }

    @IBAction func buyIcePressed(sender: UIButton) {
        accountBalance -= 1.0
        iceCount += 1
        
        updateMainView()
    }
    
    @IBAction func lemonsStepperPressed(sender: UIStepper) {
        lemonsInRecipeCount = Int(sender.value)
        updateMainView()
    }
    
    @IBAction func iceStepperPressed(sender: UIStepper) {
        iceInRecipeCount = Int(sender.value)
        updateMainView()
    }
    
    func updateMainView() {
        accountBalanceLabel.text = "$\(accountBalance)"
        lemonsCountLabel.text = "\(lemonsCount) lemon(s)"
        iceCountLabel.text = "\(iceCount) ice cube(s)"
        lemonsInRecipeCountLabel.text = "\(lemonsInRecipeCount)"
        iceInRecipeCountLabel.text = "\(iceInRecipeCount)"
    }
    @IBAction func startDayPressed(sender: AnyObject) {
        
        if (lemonsInRecipeCount == 0 || iceInRecipeCount == 0) {
            var alert = UIAlertController(title: "Earnings", message: "You must use at least 1 of each ingredient", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Fine", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            var daysRatio = lemonsInRecipeCount / iceInRecipeCount
            var earnings:Double = 0
            for customer in customers {
                if customer.preferredRatio > 0.5 && daysRatio > 0.5 {
                    earnings++
                } else if customer.preferredRatio <= 0.5 && daysRatio <= 0.5 {
                    earnings++
                }
            }
            var alert = UIAlertController(title: "Earnings", message: "You earned $\(earnings) today", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            accountBalance += earnings
            lemonsCount -= lemonsInRecipeCount
            iceCount -= iceInRecipeCount
            updateMainView()
            
            // reset customers
            for (var i = 0; i<10; i++) {
                customers[0] = Customer()
            }
        }
        

    }
}

