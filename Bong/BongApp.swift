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
 
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var userManager = UserManager()
    @StateObject private var groupManager = GroupManager()
    @StateObject private var challengesvm = ChallengesViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BongView()
                    .environmentObject(challengesvm)
                    .environmentObject(userManager)
                    .environmentObject(groupManager)
                    .preferredColorScheme(.light)
            }
            .onAppear {
                portraitOrientationLock()
            }
        }
    }
}

