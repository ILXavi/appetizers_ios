//
//  Appetizer.swift
//  Appetizers
//
//  Created by Miguel Estévez on 13/12/21.
//

import Foundation

struct Appetizer: Codable {
    let id: Int
    let calories: Int
    let name: String
    let price: Float
    let protein: Int
    let description: String
    let carbs: Int
    let imageName: String
}
