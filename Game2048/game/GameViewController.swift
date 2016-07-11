//
//  GameViewController.swift
//  Game2048
//
//  Created by Qiao on 16/7/8.
//  Copyright © 2016年 xinmei. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreView: UILabel!
    @IBOutlet weak var maxScoreView: UILabel!
    @IBOutlet weak var containerView: UIView!
    let space = 6
    let dimission = 4
    var tileWidth:Float!
    var tileViewArr:Array<UIView>!
    var tiles:Dictionary<Int,UIView>!
    var gameModel:GameModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameModel = GameModel(dimension: dimission)
        tileViewArr = Array<UIView>()
        self.addTile()
        for _ in 0...2 {
            self.genNumber()
        }
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(GameViewController.swipeUp))
        swipeUp.numberOfTouchesRequired = 1
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.containerView.addGestureRecognizer(swipeUp)
        
        let swipDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self,action: #selector(GameViewController.swipDown))
        swipDown.direction = UISwipeGestureRecognizerDirection.Down
        swipDown.numberOfTouchesRequired = 1
        self.containerView.addGestureRecognizer(swipDown)
        
        let swipLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(GameViewController.swipLeft))
        swipLeft.numberOfTouchesRequired = 1
        swipLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.containerView.addGestureRecognizer(swipLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTile() {
         tileWidth = (Float(self.containerView.frame.size.width) - Float((dimission + 1) * space)) / Float(4)
        for i in 0..<dimission {
            for j in 0..<dimission {
                let x =   Float(j) * Float(tileWidth + Float(space)) + Float(space)
                let y =   Float(i) * Float(tileWidth + Float(space)) + Float(space)
                let fram = CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(tileWidth), height: CGFloat(tileWidth))
                let tileView = UIView(frame: fram)
                self.containerView.addSubview(tileView)
                tileView.backgroundColor = UIColor.grayColor()
            }
        }
    }
    
    /*
                滑动手势事件
     */
    
    func swipeUp() {
       print("swipeUp")
       genNumber()
       gameModel.swipUpFlow()
       resetUI()
       initUI()
      
    }
    
    func swipDown() {
        genNumber()
        print("swipdown")
        gameModel.swipDownFlow()
        resetUI()
        initUI()
    }
    
    func swipLeft(){
        print("swipLeft")
        
    }
    
    func genNumber() {
        let randv = Int(arc4random_uniform(10))
        print(randv)
        var seed:Int = 2
        if randv == 1 {
            seed = 4
        }
        print(seed)
        let col = Int(arc4random_uniform(UInt32(dimission)))
        let row = Int(arc4random_uniform(UInt32(dimission)))
        insertTile((row,col),tileValue:seed)
    }
    
    func insertTile(pos:(Int,Int),tileValue:Int) {
        let (row,col) = pos
        let x = CGFloat(space) + CGFloat(col)*(CGFloat(tileWidth) + CGFloat(space))
        let y = CGFloat(space) + CGFloat(row)*(CGFloat(tileWidth) + CGFloat(space))
        let tileView = TileView(pos:CGPoint(x:x,y: y),width:CGFloat(tileWidth),value:tileValue)
        print(tileView,"\(tileValue)")
        if  gameModel.isFull() {
            print("已经满了")
            return
        }
        
        if  gameModel.setPosition(row, col: col, value:tileValue) == false {
            genNumber()
            return
        }
        tileViewArr.append(tileView)
        self.containerView.addSubview(tileView)
        self.containerView.bringSubviewToFront(tileView)
    }
    
    func reLayoutTileView(pos:(Int,Int),tileTitleV:Int) {
        let (row,col) = pos;
        let x = CGFloat(space) + CGFloat(col)*(CGFloat(tileWidth) + CGFloat(space))
        let y = CGFloat(space) + CGFloat(row)*(CGFloat(tileWidth) + CGFloat(space))
        let tileView = TileView(pos:CGPoint(x: x,y: y),width: CGFloat(tileWidth),value: tileTitleV)
        tileViewArr.append(tileView)
        self.containerView.addSubview(tileView)
        self.containerView.bringSubviewToFront(tileView)
    }
    
    func initUI() {
        for i in 0..<self.dimission {
            for j in 0..<self.dimission {
                if gameModel.tiles[i,j] != 0 {
                    reLayoutTileView((i,j), tileTitleV: gameModel.tiles[i,j])
                }
            }
        }
    }
    
    func resetUI() {
        for tileView in tileViewArr {
            tileView.removeFromSuperview()
        }
        tileViewArr.removeAll(keepCapacity: true)
    }

}
