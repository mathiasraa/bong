//
//  HomeCard.swift
//  Bong
//
//  Created by Mathias Raa on 09/02/2023.
//

import SwiftUI

struct HomeCard: View {
    @State var shouldPresentSheet = false
    
    var body: some View {
        HStack {
            Text("Start a new challenge")
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(.white)
            Spacer()
            Button {
                shouldPresentSheet.toggle()
            } label: {
                Text("Open")
                    .padding([.horizontal], 10)
                    .padding([.vertical], 5)
                    .fontWeight(.bold)
            }
            .sheet(isPresented: $shouldPresentSheet) {
                print("Sheet dismissed!")
            } content: {
                SheetView()
            }
            .tint(.pink)
            .buttonStyle(.borderedProminent)
        }
        .padding(.all, 30)
        .frame(height: 120)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(red: 0.7, green: 0.1, blue: 0.25))
        .modifier(CardModifier())
        .padding(.horizontal, 10)
    }
}

struct HomeCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCard()
    }
}
