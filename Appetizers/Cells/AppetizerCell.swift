//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by Miguel Estévez on 13/12/21.
//

import UIKit

class AppetizerCell: UITableViewCell {
    
    static let identifier = "AppetizerCellID"
    
    @IBOutlet var appetizerImageView: UIImageView!
    @IBOutlet var appetizerNameLabel: UILabel!
    @IBOutlet var appetizerPriceLabel: UILabel!
    
    var appetizer: Appetizer? {
        didSet { renderUI() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        appetizerImageView.layer.cornerRadius = 6.0
    }
    
    private func renderUI() {
        guard let appetizer = appetizer else {
            return
        }
        appetizerImageView.image = UIImage(named: appetizer.imageName)
        appetizerNameLabel.text = appetizer.name
        appetizerPriceLabel.text = "$\(appetizer.price)"
        
    }
}
