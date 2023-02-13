//
//  FinishedView.swift
//  Bong
//
//  Created by Mathias Raa on 09/02/2023.
//

import SwiftUI

struct FinishedView: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack {
                Text("Good job, bro.")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    .fontDesign(.monospaced)
                    .padding([.bottom], 20)
                
                Button{} label: {
                    Text("Who's next?")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                    
            }.zIndex(10)
                .frame(maxWidth: 300)
            
            ZStack {
                Text("© Copyright 2023, Bancroft Boys.")
                    .foregroundColor(.gray)
                    .frame(alignment: .bottom)
                    .font(.system(size: 10))
                    
            }.frame(maxHeight: .infinity,alignment: .bottom)
        }
    }
}

struct FinishedView_Previews: PreviewProvider {
    static var previews: some View {
        FinishedView()
    }
}
