//
//  Card.swift
//  Bong
//
//  Created by Mathias Raa on 09/02/2023.
//

import SwiftUI

struct Card: View {
    var challenge: Challenge
    
    var body: some View {
        HStack(alignment: .center) {
//            section.image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100)
//                .padding(.all, 20)
            
            VStack(alignment: .leading) {
                Text(challenge.title)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text(challenge.user)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                HStack {
                    Text(String(challenge.time))
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }
            }.padding(.trailing, 20)
            Spacer()
        }
        .padding(.all, 30)
        .frame(height: 150)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .modifier(CardModifier())
        .padding(.horizontal, 10)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
