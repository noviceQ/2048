//
//  MainController.swift
//  Game2048
//
//  Created by Qiao on 16/7/8.
//  Copyright © 2016年 xinmei. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let gameVC = GameViewController(nibName: "GameViewController",bundle: nil)
        let gameNav = UINavigationController(rootViewController: gameVC)
        gameNav.tabBarItem.image = UIImage.init(named: "game")
        gameNav.tabBarItem.selectedImage = UIImage(named: "game_pressed")
        gameNav.tabBarItem.title = "game"
        let settingVC = SettingViewController(nibName: "SettingViewController",bundle: nil)
        let settingNav = UINavigationController(rootViewController: settingVC)
        settingNav.tabBarItem.image = UIImage(named: "setting")
        settingNav.tabBarItem.selectedImage = UIImage(named: "setting_pressed")
        settingNav.tabBarItem.title = "setting"
        self.viewControllers = [gameNav,settingNav]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
