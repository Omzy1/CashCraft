//
//  AppDelegate.swift
//  CashCraft
//
//  Created by omar sillah on 12/12/2024.
//

import Foundation
import UIKit

/// AppDelegate is the entry point of the App, manage configuations, analytics , logs and app states
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // firebase config will go here
        
        
        print("AppDelegate: App Lanched Successfully")
        return true
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App Entered background")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("App Entered ForeGround")
    }
    
}
