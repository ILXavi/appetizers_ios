//
//  ProfileVC.swift
//  Appetizers
//
//  Created by Miguel Estévez on 13/12/21.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDataSource, UITableViewDelegate, FormCellDelegate {
    
    struct FormSection {
        var title: String
        var cellItems: [CellItem]
    }
    
    let sections: [FormSection] = [
        FormSection(title: "PERSONAL INFO", cellItems: [
            .firstNameCell(.text),
            .lastNameCell(.text),
            .emailCell(.text),
            .birthdateCell(.date),
            .saveCell(.button)
        ]),
        FormSection(title: "REQUESTS", cellItems: [
            .extraNapkins(.toogle),
            .refill(.toogle),
            
        ])
    ]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "😀 Profile"
        tabBarItem.title = "Profile"
    }
    
    
    // MARK: - UITableView delegate & data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItem = sections[indexPath.section].cellItems[indexPath.row]
        return FormCell.cellWith(item: cellItem, forTableView: tableView, at: indexPath, delegate: self)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    // MARK: - FormCell delegate
    func didSaveUser(success: Bool) {
        let message = success ? "User information was saved successfully." :
                                "User information could not be saved."
        let alert = UIAlertController(title: "Appetizers", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
