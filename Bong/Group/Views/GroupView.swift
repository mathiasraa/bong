//
//  GroupView.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct GroupView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var groupManager: GroupManager
    @State private var isPresentingQRCode = false
    
    var body: some View {
        NavigationView {
            VStack {
                GroupBarView()
                
                Divider()
                
                GroupScrollView()
                
                //Text(userManager.user?.id ?? "hei")
                /*Button {
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
                })*/
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}













struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
