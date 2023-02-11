//
//  AnimationView.swift
//  Bong
//
//  Created by Mathias Raa on 09/02/2023.
//

import SwiftUI

struct AnimationView: View {
    @State private var calendarWiggles = false
    
    @State private var bouncing = false
    @State private var isRotating = 0.0
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            // Your other content here
            // Other layers will respect the safe area edges
            ZStack {
                VStack {
                    Text("The bong is yours, bro.")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.black)
                        .fontDesign(.monospaced)
                        .padding([.bottom], 20)
                    
                    Text("Take it before it's too late.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                    
                }.zIndex(10)
                    .frame(maxWidth: 300)
                
                Image("Bong")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(height: 600)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(calendarWiggles ? -4 : 4))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)
                            .speed(0.5).repeatForever(autoreverses: true)) {
                                calendarWiggles = true
                            }
                    }
            }
            ZStack {
                Text("© Copyright 2023, Bancroft Boys.")
                    .foregroundColor(.gray)
                    .frame(alignment: .bottom)
                    .font(.system(size: 10))
                    
            }.frame(maxHeight: .infinity,alignment: .bottom)
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
