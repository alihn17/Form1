//
//  Person.swift
//  Form
//
//  Created by Ali on 7/26/18.
//  Copyright © 2018 Ali. All rights reserved.
//

import Foundation

struct Person{
    
    var name = ""
    var family = ""
    var gender = false
    var lastChild = true
    var tall:Float = 1.7
    
    mutating func setValue(arr:NSArray){
        
        name = arr[0] as! String
        family = arr[1] as! String
        if (arr[2] as! String) == "Male"{
            gender = false
        }else if (arr[2] as! String) == "Female"{
            gender = true
        }
        if (arr[3] as! String) == "1"{
            lastChild = true
        }else if (arr[3] as! String) == "0"{
            lastChild = false
        }
        tall = Float(arr[4] as! String)!

    }
    
    func getForTableCell() -> String{
        return "Name: \(name), Family: \(family), Gender: \(gender)."
    }
    
}
