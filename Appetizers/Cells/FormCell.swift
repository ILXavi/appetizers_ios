//
//  FormCell.swift
//  Appetizers
//
//  Created by Miguel Estévez on 19/12/21.
//

import UIKit


protocol FormCellDelegate {
    func didSaveUser(success: Bool)
}

class FormCell: UITableViewCell {

    var cellItem: CellItem!
    var delegate: FormCellDelegate?
    
    @IBOutlet var toogle: UISwitch!
    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var button: UIButton!
    
    
    // MARK: - Public methods
    static func cellWith(item cellItem: CellItem,
                         forTableView tableView: UITableView,
                         at indexPath: IndexPath,
                         delegate: FormCellDelegate? = nil) -> FormCell {
        var cell: FormCell
        let user = DataSource.shared.user
        
        switch cellItem {
        case .firstNameCell(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell
            cell.textField.placeholder = "First Name"
            cell.textField.text = user.firstName
            
        case .lastNameCell(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell
            cell.textField.placeholder = "Last Name"
            cell.textField.text = user.lastName
            
        case .emailCell(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell
            cell.textField.placeholder = "Email"
            cell.textField.keyboardType = .emailAddress
            cell.textField.text = user.email
            
        case .repeatEmailCell(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell
            cell.textField.placeholder = "Repeat Email"
            cell.textField.keyboardType = .emailAddress
            cell.textField.text = user.email
            
        case .birthdateCell(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell
            cell.datePicker.date = user.birthdate
            
        case .saveCell(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell

        case .extraNapkins(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell
            cell.label.text = "Extra Napkins"
            cell.toogle.isOn = user.extraNapkins
            
        case .refill(let cellType):
            cell = tableView.dequeueReusableCell(withIdentifier: identifier(for: cellType), for: indexPath) as! FormCell
            cell.label.text = "Frecuent Refill"
            cell.toogle.isOn = user.refill
        }
        
        cell.delegate = delegate
        cell.cellItem = cellItem
        return cell
    }
    
    
    // MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        let result = DataSource.shared.saveUser()
        delegate?.didSaveUser(success: result)
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        let user = DataSource.shared.user
        if let textField = sender as? UITextField {
            let text = textField.text ?? ""
            switch cellItem {
            case .firstNameCell(_): user.firstName = text
            case .lastNameCell(_): user.lastName = text
            case .emailCell(_): user.email = text
            default: break
            }
        }
        if let toogle = sender as? UISwitch {
            switch cellItem {
            case .extraNapkins(_): user.extraNapkins = toogle.isOn
            case .refill(_): user.refill = toogle.isOn
            default: break
            }
        }
        if let datePicker = sender as? UIDatePicker {
            user.birthdate = datePicker.date
        }
    }
    
    @IBAction func didEndOnExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    // MARK: - Private methods
    private static func identifier(for cellType: CellType) -> String {
        switch cellType {
        case .text:   return "TextInputCellID"
        case .date:   return "BirthdateCellID"
        case .button: return "ButtonCellID"
        case .toogle: return "ToogleCellID"
        }
    }
    
}
