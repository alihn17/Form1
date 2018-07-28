//
//  Plist.swift
//  Form
//
//  Created by Ali on 7/26/18.
//  Copyright © 2018 Ali. All rights reserved.
//

import Foundation

class Plist{
    
    // MARK: Creat plistPath
    let formPlistPath = Bundle.main.path(forResource: "FormList", ofType: "plist")  // the real path
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/FormList.plist"    // the document path
    var root : NSMutableArray
//    var root : NSMutableArray{
//        get{
//            return NSMutableArray.init(contentsOfFile: path)!
//        }
//        set{
//
//        }
//    }

    func addToRoot(arr:Array<String>){
        
        root.insert(arr, at: root.count)
        root.write(toFile: self.path, atomically: true)
    }
    func deleteRow(at row:Int){
        root.removeObject(at: row)
        root.write(toFile: self.path, atomically: true)
    }
    
    init(){
        root = NSMutableArray.init(contentsOfFile: path)!
    }
}
