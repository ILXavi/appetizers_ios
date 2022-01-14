//
//  OrderVC.swift
//  Appetizers
//
//  Created by Miguel Estévez on 13/12/21.
//

import UIKit

class OrderVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "📝 Order"
        tabBarItem.title = "Order"
        orderButton.layer.cornerRadius = 6.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        setupView()
        setupButtonTitle()
    }
    
    private func setupView() {
        tableView.isHidden = DataSource.shared.orderedAppetizers.count == 0
        orderButton.isHidden = DataSource.shared.orderedAppetizers.count == 0
    }
    
    private func setupButtonTitle() {
        orderButton.setAttributedTitle(NSAttributedString(string: "$\(DataSource.shared.totalCost) - Place Order",
                                                    attributes:
                                                            [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
    }
    
    
    // MARK: - UITableView delegate & data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.shared.orderedAppetizers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppetizerCell.identifier, for: indexPath) as! AppetizerCell
        cell.appetizer = DataSource.shared.orderedAppetizers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            DataSource.shared.orderedAppetizers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            if DataSource.shared.orderedAppetizers.count == 0 {
                tabBarController!.tabBar.items![2].badgeValue = nil
                setupView()
            }
            else {
                tabBarController!.tabBar.items![2].badgeValue = "\(DataSource.shared.orderedAppetizers.count)"
                setupButtonTitle()
            }
        }
    }
}
