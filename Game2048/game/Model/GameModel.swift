//
//  GameModel.swift
//  Game2048
//
//  Created by Qiao on 16/7/8.
//  Copyright © 2016年 xinmei. All rights reserved.
//

import Foundation
struct  planarArray {//抽象二维数组
    let rows:Int , colums:Int
    var dataSource:[Int]
    init (row:Int,col:Int) {
        self.rows = row
        self.colums = col
        self.dataSource = Array(count: self.rows * self.colums, repeatedValue: 0)
    }
    
    func indexIsValidForRow(row:Int,col:Int) -> Bool {
        return row >= 0 && row < self.rows && col >= 0 && col < self.colums
    }
    
    subscript(row:Int,col:Int) -> Int{
        get {
            assert(indexIsValidForRow(row, col: col),"超出范围")
            return self.dataSource[row * colums + col]
        }
    
        set {
            assert(indexIsValidForRow(row, col: col),"超出范围")
            self.dataSource[row * colums + col] = newValue
        }
    }
}

class GameModel {
    var dimension:Int = 0
    var tiles:planarArray
    init(dimension:Int) {
        self.dimension = dimension
        self.tiles = planarArray(row: dimension,col: dimension)
    }
    
    func emptyPosition() -> [Int] {
        var emptyTiles = Array<Int>()
        for  row in 0..<self.dimension {
            for col in 0..<self.dimension {
                let val = tiles[row,col]
                if  val == 0 {
                    emptyTiles.append(tiles[row,col])
                }
            }
        }
        return emptyTiles;
    }
    
    func isFull() -> Bool {
        if emptyPosition().count == 0 {
            return true
        }
        return false
    }
    
    func printTiles() {
        print("输出数据")
        for i in 0..<self.dimension {
            for j in 0..<self.dimension  {
                print("\(self.tiles[i,j])",terminator:"\t")
            }
            print("")
        }
    }
    
    func setPosition(row:Int,col:Int,value:Int) -> Bool {
        assert(row>=0 && row < dimension)
        assert(col >= 0 && col < dimension)
        let tmpV = tiles[row,col]
        if tmpV > 0 {
            print("该位置已经有值")
            return false
        }
        printTiles()
        tiles[row,col] = value
        printTiles()
        return true
    }
    
    func swipUpFlow() {
        for _ in 0..<self.dimension - 1  {
            for row in 1..<self.dimension {
                for col in 0..<self.dimension {
                    if tiles[row,col] > 0 && tiles[row - 1,col] == 0 {
                        tiles[row - 1 , col] = tiles[row,col]
                        tiles[row,col] = 0
                    }
                }
            }
        }
        printTiles()
    }
    
    func swipDownFlow() {
        for _ in 0..<self.dimension - 1 {
            for row in (0...(self.dimension - 1 - 1)).reverse() {
                print(row)
                for col in 0..<self.dimension {
                    if tiles[row,col] > 0 && tiles[row + 1,col] == 0  {
                        tiles[row + 1,col] = tiles[row,col]
                        tiles[row,col] = 0
                    }
                }
            }
        }
        printTiles()
    }
    
}