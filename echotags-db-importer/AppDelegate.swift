//
//  AppDelegate.swift
//  echotags-db-importer
//
//  Created by bkzl on 25/05/16.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if let url = Realm.Configuration.defaultConfiguration.fileURL {
            do {
                try NSFileManager.defaultManager().removeItemAtURL(url)
                print(url)
            } catch {
                print(error)
            }
        }
        
        return true
    }

}

