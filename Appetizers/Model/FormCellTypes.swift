//
//  FormCellTypes.swift
//  Appetizers
//
//  Created by Miguel Estévez on 20/12/21.
//

import Foundation

enum CellType {
    case text
    case date
    case button
    case toogle
}

enum CellItem {
    case firstNameCell(CellType)
    case lastNameCell(CellType)
    case emailCell(CellType)
    case repeatEmailCell(CellType)
    case birthdateCell(CellType)
    case saveCell(CellType)
    case extraNapkins(CellType)
    case refill(CellType)
    
    /*
    var name: String {
        switch self {
        case .firstNameCell(_):
            return "firstNameCell"
        case .lastNameCell(_):
            return "lastNameCell"
        case .emailCell(_):
            return "emailCell"
        case .birthdateCell(_):
            return "birthdateCell"
        case .saveCell(_):
            return "saveCell"
        case .extraNapkins(_):
            return "extraNapkins"
        case .refill(_):
            return "refill"
        }
    }
     */
}

