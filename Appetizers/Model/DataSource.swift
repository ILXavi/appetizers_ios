//
//  MockData.swift
//  Appetizers
//
//  Created by Miguel Estévez on 13/12/21.
//

import Foundation

class DataSource {
    
    private let userDefaultsKey = "UserDefaultsKey"
    
    static let shared = DataSource()
    
    var appetizers = [Appetizer]()
    var orderedAppetizers = [Appetizer]()
    
    lazy var user: User = {
        if let data = UserDefaults.standard.object(forKey: userDefaultsKey) as? Data {
            return try! JSONDecoder().decode(User.self, from: data)
        }
        return User()
    }()
    
    @discardableResult func saveUser() -> Bool {
        do {
            let data = try JSONEncoder().encode(user)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
            return true
        }
        catch {
            return false
        }
    }
    
    var totalCost: Float {
        // orderedAppetizers.reduce(0, { $0 + $1.price })
        var cost: Float = 0
        for ap in orderedAppetizers {
            cost = cost + ap.price
        }
        return cost
    }
    
    private init() {
        appetizers = loadAppetizers()
    }
    
    private func loadAppetizers() -> [Appetizer] {
        let filename = "appetizers.json"
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Appetizer].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(Appetizer.self):\n\(error)")
        }
    }
    
}
