//
//  GroupScrollView.swift
//  Bong
//
//  Created by Nick Askari on 12/02/2023.
//

import SwiftUI

struct GroupScrollView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var groupManager: GroupManager
    @State private var isPresentingQRCode = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                GroupMembersBox()
                    .padding(.horizontal, 10)
                
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
        .navigationBarTitle("") 
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}












struct GroupScrollView_Previews: PreviewProvider {
    static var previews: some View {
        GroupScrollView()
    }
}
