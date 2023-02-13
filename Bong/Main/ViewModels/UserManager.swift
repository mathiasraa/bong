//
//  UserManager.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import Foundation
import FirebaseAuth
import Firebase
import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

class UserManager: ObservableObject {
    private let db = Firestore.firestore()
    @Published var user: User?
    
    func signIn() async {
        if Auth.auth().currentUser == nil {
            do {
                try await Auth.auth().signInAnonymously()
            } catch {
                print(error.localizedDescription)
            }
            await addUser()
        }
        fetchUser()
    }
    
    func fetchUser() {
        db.collection("users").whereField("id", isEqualTo: Auth.auth().currentUser?.uid ?? "").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            for document in documents {
                do {
                    let fethcedUser = try document.data(as: User.self)
                    self.user = fethcedUser
                } catch {
                    try? Auth.auth().signOut()
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getUserID() -> String {
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    private func addUser() async {
        let ref = db.collection("users")
        let uid = Auth.auth().currentUser?.uid
        
        if let uid = uid {
            do {
                try await ref.document(uid).setData([
                    "id": uid
                ])
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        fetchUser()
        
        //        if let uid = uid {
        //            ref.addDocument(data: [
        //                "id" : uid
        //            ])
        //        }
    }
    
    // FOR DEBUGGING 
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
