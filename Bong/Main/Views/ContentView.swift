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
            VStack {
                Text(userManager.user?.id ?? "hei")
                Button {
                    leaveGroup()
                } label: {
                    Text("Leave group")
                }
            }
        } else {
            VStack {
                Text(userManager.user?.groupID ?? "hei")
                Text(userManager.user?.id ?? "hei")
                HomeView()
                    .tabItem {
                        Label("Animation", systemImage: "person")
                    }
                    .task {
                        await userManager.signIn()
                    }
            }
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
    private func leaveGroup() {
        let uid = Auth.auth().currentUser?.uid
        
        if let uid = uid {
            db.collection("users").whereField("id", isEqualTo: uid).getDocuments { (result, error) in
                if error == nil{
                    for document in result!.documents{
                        //document.setValue("1", forKey: "isolationDate")
                        db.collection("users").document(document.documentID).setData([ "groupID": "" ], merge: true)
                    }
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
