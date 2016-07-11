//
//  TileView.swift
//  Game2048
//
//  Created by Qiao on 16/7/8.
//  Copyright © 2016年 xinmei. All rights reserved.
//

import UIKit
class TileView: UIView {
    var numberLable:UILabel!
    let colorMap  = [
        2:UIColor.redColor(),
        4:UIColor.orangeColor(),
        8:UIColor.yellowColor(),
        16:UIColor.greenColor(),
        32:UIColor.brownColor(),
        64:UIColor.blueColor(),
        128:UIColor.purpleColor(),
        256:UIColor.cyanColor(),
        512:UIColor.lightGrayColor(),
        1024:UIColor.magentaColor(),
        2048:UIColor.blackColor()
    ];
    
    
    var value:Int = 0 {
        didSet {
            backgroundColor = colorMap[value]
            numberLable.text = "\(value)"
        }
    }
    
    init(pos:CGPoint,width:CGFloat,value:Int) {
        super.init(frame:CGRectMake(pos.x, pos.y, width,width))
        numberLable = UILabel(frame:CGRectMake(0, 0, width, width))
        numberLable.textColor = UIColor.whiteColor()
        numberLable.textAlignment = NSTextAlignment.Center
        numberLable.minimumScaleFactor = 0.5
        numberLable.font = UIFont(name: "微软雅黑",size: 20)
        numberLable.text = "\(value)"
        addSubview(numberLable)
        self.value = value
        backgroundColor = colorMap[value]
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
