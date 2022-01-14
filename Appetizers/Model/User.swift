//
//  User.swift
//  Appetizers
//
//  Created by Miguel Estévez on 19/12/21.
//

import Foundation

class User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthdate: Date = Date()
    var extraNapkins: Bool = false
    var refill: Bool = false
}
