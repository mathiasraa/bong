//
//  Extentions .swift
//  Bong
//
//  Created by Nick Askari on 10/02/2023.
//

import SwiftUI
import Foundation

extension Text {
    func capsuleStyle(_ color: Color) -> some View {
        self
            .padding(EdgeInsets(top: 20, leading: 60, bottom: 20, trailing: 60))
            .foregroundColor(.white)
            .background(Capsule().foregroundColor(color))
            .shadow(radius: 5)
    }
}


