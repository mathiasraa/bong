//
//  GroupBarView.swift
//  Bong
//
//  Created by Nick Askari on 12/02/2023.
//

import SwiftUI

struct GroupBarView: View {
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var groupManager: GroupManager
    
    @AppStorage("groupName") private var groupName: String = ""
    
    @State private var showProfilePage: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 70) {
            Text(groupName)
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .fontWidth(.expanded)
                .font(.system(size: 50))
            
            Spacer()
            
            profileView
        }
        .scaledToFit()
        .padding()
        .padding(.top, 35)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $showProfilePage) {
            ProfileView()
        }
    }
    
    // BUG
    private var profileView: some View {
        Button {
            self.showProfilePage.toggle()
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(.black)
                    .scaledToFit()
                
                Image(systemName: "person")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }
            .shadow(radius: 5)
        }
    }
}













struct GroupBarView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBarView()
    }
}
