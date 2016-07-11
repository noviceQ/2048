//
//  main.swift
//  testCode
//
//  Created by Qiao on 16/7/9.
//  Copyright © 2016年 xinmei. All rights reserved.
//

import Foundation
var i:Int = 0
while i != 8 {
    let rendV = Int(arc4random_uniform(10))
    print("\(rendV)")
    i = rendV
}
