//
//  AppDelegate.swift
//  Bong
//
//  Created by Nick Askari on 12/02/2023.
//

import UIKit
import SwiftUI
import Firebase
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.all
    var window: UIWindow?

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
                                    
        return true
    }
    
}
