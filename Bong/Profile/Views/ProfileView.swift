//
//  ProfileView.swift
//  Bong
//
//  Created by Nick Askari on 12/02/2023.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("MR. BONGs profile page!! ")
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Leave this awesome profile page!")
            }

        }
    }
}









struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
