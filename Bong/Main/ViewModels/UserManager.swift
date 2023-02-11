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

class UserManager: ObservableObject {
    private let db = Firestore.firestore()
    
    func signIn() async {
        if Auth.auth().currentUser != nil {
            signOut()
        }
        
        do {
            try await Auth.auth().signInAnonymously()
        } catch {
            print(error.localizedDescription)
        }
        await addUser()
        
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
                    "uid": uid
                ])
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        //        if let uid = uid {
        //            ref.addDocument(data: [
        //                "id" : uid
        //            ])
        //        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
