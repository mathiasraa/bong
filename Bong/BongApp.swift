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
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
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
                            
                            if Auth.auth().currentUser == nil {
                                Auth.auth().signInAnonymously()
                            }
                            Auth.auth().signInAnonymously { authResult, error in
                                guard let user = authResult?.user else { return }
                                let isAnonymous = user.isAnonymous  // true
                                let uid = user.uid
                            }
                            
                            return true
                        }
}
