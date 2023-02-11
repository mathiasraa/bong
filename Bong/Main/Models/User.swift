//
//  User.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String? = UUID().uuidString
    let groupID: String?
}
