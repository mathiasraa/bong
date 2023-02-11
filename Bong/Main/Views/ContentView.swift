//
//  ContentView.swift
//  Bong
//
//  Created by Mathias Raa on 08/02/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject private var userManager: UserManager
    
    private let db = Firestore.firestore()
    
        
    var body: some View {
        if userManager.user != nil && userManager.user?.groupID != nil && userManager.user?.groupID != "" {
            GroupView()
        } else {
            VStack {
                HomeView()
                    .tabItem {
                        Label("Animation", systemImage: "person")
                    }
                    .task {
                        await userManager.signIn()
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
