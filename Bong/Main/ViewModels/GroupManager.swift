//
//  GroupManager.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import Foundation
import FirebaseAuth
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

class GroupManager: ObservableObject {
    private let db = Firestore.firestore()
    private let uid = Auth.auth().currentUser?.uid
    @Published var group: Group?
    
    func createGroup(group: Group) {
        let ref = db.collection("groups")
        let docRef = ref.addDocument(data: [
            "id": group.id,
            "name" : group.name
        ])
        
        if let uid = uid {
            let ref = db.collection("users")
            
            ref.whereField("id", isEqualTo: uid).getDocuments { (result, error) in
                if error == nil{
                    for document in result!.documents{
                        //document.setValue("1", forKey: "isolationDate")
                        ref.document(document.documentID).setData([ "groupID": docRef.documentID ], merge: true)
                    }
                }
            }
            
        }
    }
    
    func leaveGroup() {
        if let uid = uid {
            let ref = db.collection("users")
            
            ref.whereField("id", isEqualTo: uid).getDocuments { (result, error) in
                if error == nil{
                    for document in result!.documents{
                        //document.setValue("1", forKey: "isolationDate")
                        ref.document(document.documentID).setData([ "groupID": "" ], merge: true)
                    }
                }
            }
            
        }
    }
}
