//
//  BongApp.swift
//  Bong
//
//  Created by Mathias Raa on 08/02/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
struct BongApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var userManager = UserManager()
    @StateObject private var groupManager = GroupManager()
    @StateObject private var challengesvm = ChallengesViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(challengesvm)
                    .environmentObject(userManager)
                    .environmentObject(groupManager)
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication
                        .LaunchOptionsKey: Any]?) -> Bool {
                            FirebaseApp.configure()
                                                        
                            return true
                        }
}
