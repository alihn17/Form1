//
//  AppDelegate.swift
//  Form
//
//  Created by Ali on 7/25/18.
//  Copyright © 2018 Ali. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var scheme: String!
    var path: String!
    
    var query: String!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // MARK: Copy plist to document diractory
        let plist = Plist()
        let filemanager = FileManager.default
        if !filemanager.fileExists(atPath: plist.path){
            do{
                try filemanager.copyItem(atPath: plist.formPlistPath!, toPath: plist.path)
                print("The plist copied succesfully")
            }
            catch{
                print("Copy failure")
            }
        }else{
            print("The plist already exist")
        }
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        var person = Person()
        if let host = url.host{
            let hostArray = host.components(separatedBy: "&")
            
            var parameter = hostArray[0].components(separatedBy: "=")
            person.name = parameter[1]
            
            parameter = hostArray[1].components(separatedBy: "=")
            person.family = parameter[1]
            
            parameter = hostArray[2].components(separatedBy: "=")
            if parameter[1] == "male"{
                person.gender = false
            }else{
                person.gender = true
            }
            
            parameter = hostArray[3].components(separatedBy: "=")
            if parameter[1] == "yes"{
                person.lastChild = true
            }else{
                person.lastChild = false
            }
            
            parameter = hostArray[4].components(separatedBy: "=")
            person.tall = Float(parameter[1])!
            
        }
        
        window?.rootViewController?.performSegue(withIdentifier: "gotoWithLink", sender: person)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

