//
//  User.swift
//  Bong
//
//  Created by Mathias Raa on 10/02/2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let groupID: String?
}
