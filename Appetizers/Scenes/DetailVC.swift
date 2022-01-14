//
//  DetailVC.swift
//  Appetizers
//
//  Created by Miguel Estévez on 14/12/21.
//

import UIKit

protocol DetailViewControllerDelegate {
    func didAddToOrder(appetizer: Appetizer)
}

class DetailVC: UIViewController {
    
    var appetizer: Appetizer?
    var delegate: DetailViewControllerDelegate?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var caloriesLabel: UILabel!
    @IBOutlet var carbsLabel: UILabel!
    @IBOutlet var proteinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appetizer = appetizer {
            imageView.image = UIImage(named: appetizer.imageName)
            addButton.layer.cornerRadius = 6.0
            addButton.setAttributedTitle(NSAttributedString(string: "$\(appetizer.price) - Add to Order",
                                                            attributes:
                                                                [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
            nameLabel.text = appetizer.name
            descriptionLabel.text = appetizer.description
            caloriesLabel.text = "\(appetizer.calories)"
            carbsLabel.text = "\(appetizer.carbs) g"
            proteinLabel.text = "\(appetizer.protein) g"
        }
    }
    
    @IBAction func addOrderButtonTapped(_ button: UIButton) {
        guard let appetizer = appetizer else { return }
        delegate?.didAddToOrder(appetizer: appetizer)
    }
}
