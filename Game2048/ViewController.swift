//
//  ViewController.swift
//  Game2048
//
//  Created by Qiao on 16/7/8.
//  Copyright © 2016年 xinmei. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startGame(sender: AnyObject) {
        let alert = UIAlertController(title: "开始游戏", message: "祝你游戏愉快!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "开始",style: UIAlertActionStyle.Default,handler: {(UIAlertAction) in
                let mainController = MainController();
                self.presentViewController(mainController, animated: true, completion: { 
                    print("display main controller view")
                })
            }))
        self.presentViewController(alert, animated: true) { 
            print("display alert controller")
        }
    }


}

