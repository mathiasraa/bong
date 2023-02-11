//
//  ContentView.swift
//  Bong
//
//  Created by Mathias Raa on 08/02/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        HomeView()
            .tabItem {
                Label("Animation", systemImage: "person")
            }
            .task {
                await userManager.signIn()
            }
//        TabView {
//            HomeView()
//                .tabItem {
//                    Label("Home", systemImage: "house")
//                }
//
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person")
//                }
//
//            AnimationView()
//                .tabItem {
//                    Label("Animation", systemImage: "person")
//                }
//        }.tint(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
