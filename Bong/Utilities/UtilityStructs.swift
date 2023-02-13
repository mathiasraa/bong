//
//  UtilityStructs.swift
//  Bong
//
//  Created by Nick Askari on 12/02/2023.
//

import Foundation
import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(20)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.05))
            .cornerRadius(8)
    }
}
