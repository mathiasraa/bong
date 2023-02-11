//
//  CreateGroupView.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import SwiftUI
import Firebase


struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(20)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.05))
            .cornerRadius(8)
    }
}

struct CreateGroupView: View {
    //1
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var groupManager: GroupManager
    
    @State private var groupName: String = ""
    private let db = Firestore.firestore()
    
    var body: some View {
        VStack {
            //            //2
            //            HStack {
            //                Spacer()
            //                Button("Cancel") {
            //                    //3
            //                    self.presentationMode.wrappedValue.dismiss()
            //                }.padding()
            //                    .tint(.black)
            //                    .fontDesign(.monospaced)
            //            }
            Spacer()
            VStack(spacing: 20) {
                HStack {
                    TextField(
                        "Name your group",
                        text: $groupName
                    )
                }
                .textFieldStyle(CustomTextFieldStyle())
                .frame(maxWidth: 300, alignment: .center)
                .fontDesign(.monospaced)
                .font(.title3)
                .fontWeight(.bold)
                .disableAutocorrection(true)
                Button{
                    groupManager.createGroup(group: Group(id: UUID().uuidString, name: groupName))
                } label: {
                    Text("Create group")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                        .padding(5)
                }
                .tint(.black)
            }
            Spacer()
            
        }
    }
}

struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
