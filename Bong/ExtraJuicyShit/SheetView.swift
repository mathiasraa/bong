//
//  SheetView.swift
//  Bong
//
//  Created by Mathias Raa on 09/02/2023.
//

import SwiftUI



struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"
    @State private var username: String = ""

    var body: some View {
        VStack {
            HStack {
                Text("Create a new Challenge")
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                Button("Dismiss") {
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .padding(25)
            
            Form{
                Picker("Please choose a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                TextField(
                    "Write your challenge",
                    text: $username,
                    axis: .vertical
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .lineLimit(5...10)
                
                Button("Save changes") {
                    // activate theme!
                }
                }
                
            
            }
        

    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
