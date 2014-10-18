//
//  Customer.swift
//  Lemonade Stand
//
//  Created by David Aragon on 10/18/14.
//  Copyright (c) 2014 David Aragon. All rights reserved.
//

import Foundation
import UIkit

class Customer {
    var preferredRatio:CGFloat = CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(0 - 1) + min(0, 1)
}