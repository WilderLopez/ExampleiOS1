//
//  InputNameCell.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit

protocol SaveNameCellDelegate {
    func getTextFieldString(string: String)
}

class InputNameCell: UITableViewCell , UITextFieldDelegate{
    static let reusableID : String = "InputNameCellID"
    
    @IBOutlet weak var  tf_name : UITextField!
    
    var delegate : SaveNameCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if self.tf_name != nil {
            self.tf_name.delegate = self as UITextFieldDelegate
        }
        
        tf_name.returnKeyType = UIReturnKeyType.done
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string.rangeOfCharacter(from: NSCharacterSet.letters) != nil) || string == "" || string == " "{
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let string = textField.text {
            delegate?.getTextFieldString(string: string)
        }
        textField.resignFirstResponder()
        
        return true
    }
    

}
