//
//  CreateGroupView.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct CreateGroupView: View {
    //1
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var groupManager: GroupManager
    
    @State private var chosenName: String = ""
    @State private var showDisclaimer: Bool = false
    
    @AppStorage("groupName") private var groupName = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {

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
            
            VStack(spacing: 20) {
                
                Spacer()
                nameGroupTextfield
                createGroupButton
                cancelButton
                Spacer()
                
            }
            
            if showDisclaimer {
                VStack {
                    Spacer()
                    
                    withAnimation {
                        disclaimer
                    }
                }
            }
        }
    }
    
    private var nameGroupTextfield: some View {
        HStack {
            TextField(
                "Name your group",
                text: $chosenName
            )
        }
        .textFieldStyle(CustomTextFieldStyle())
        .frame(maxWidth: 300, alignment: .center)
        .fontDesign(.monospaced)
        .font(.title3)
        .fontWeight(.bold)
        .disableAutocorrection(true)
    }
    
    private var createGroupButton: some View {
        Button {
            if groupManager.isValidGroupName(chosenName) {
                groupManager.createGroup(group: Group(id: UUID().uuidString, name: chosenName))
                getTapticFeedBack(style: .rigid)
                self.groupName = chosenName
            } else {
                self.showDisclaimer = true
            }
        } label: {
            Text("Create group")
                .mathiasStyle()
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
    }
    
    private var cancelButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Cancel")
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .padding(5)
        }
        .tint(.black)
    }
    
    private var disclaimer: some View {
        Text("Make sure that the name is not empty or already taken.")
            .rectStyle(.black)
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showDisclaimer = false
                    }
                }
            }
    }
}







struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
