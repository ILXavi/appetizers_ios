//
//  ViewController.swift
//  Appetizers
//
//  Created by Miguel Estévez on 13/12/21.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailViewControllerDelegate {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "🍟 Appetizers"
        tabBarItem.title = "Appetizers"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ApettizersToDetailSegue" {
            let appetizer = sender as! Appetizer
            let detailVC = segue.destination as! DetailVC
            detailVC.appetizer = appetizer
            detailVC.delegate = self
        }
    }

    // MARK: - UITableView delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.shared.appetizers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppetizerCell.identifier, for: indexPath) as! AppetizerCell
        cell.appetizer = DataSource.shared.appetizers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let appetizer = DataSource.shared.appetizers[indexPath.row]
        performSegue(withIdentifier: "ApettizersToDetailSegue", sender: appetizer)
    }
    
    // MARK: - DetailVC delegate methods
    func didAddToOrder(appetizer: Appetizer) {
        DataSource.shared.orderedAppetizers.append(appetizer)
        tabBarController!.tabBar.items![2].badgeValue = "\(DataSource.shared.orderedAppetizers.count)"
        dismiss(animated: true, completion: nil)
    }

}

