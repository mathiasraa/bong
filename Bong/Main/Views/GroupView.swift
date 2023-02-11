//
//  GroupView.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct GroupView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var groupManager: GroupManager
    private let db = Firestore.firestore()
    @State private var isPresentingQRCode = false
    
    var body: some View {
        VStack {
            
            Text(userManager.user?.id ?? "hei")
            Button {
                groupManager.leaveGroup()
            } label: {
                Text("Leave group")
            }
            Button{
                isPresentingQRCode = true
            } label: {
                Text("Share group")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .fontDesign(.monospaced)
                    .padding(5)
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            
            .sheet(isPresented: $isPresentingQRCode, content: {
                QRGeneratorView(text: "bong_\(userManager.user?.groupID ?? "")")
            })
        }
    }
    
//    private func leaveGroup() {
//        let uid = Auth.auth().currentUser?.uid
//
//        if let uid = uid {
//            db.collection("users").whereField("id", isEqualTo: uid).getDocuments { (result, error) in
//                if error == nil{
//                    for document in result!.documents{
//                        //document.setValue("1", forKey: "isolationDate")
//                        db.collection("users").document(document.documentID).setData([ "groupID": "" ], merge: true)
//                    }
//                }
//            }
//
//        }
//    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
