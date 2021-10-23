//
//  TakeSalfieCell.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit

protocol TakeSelfieCellDelegate {
    func triggerPopUp()
}

class TakeSalfieCell: UITableViewCell {
    static let reusableID = "TakeSalfieCellID"
    
    @IBOutlet weak var btn_selfie : UIButton!
    
    var delegate : TakeSelfieCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func pressBtn(_ sender: Any) {
        print("press btn")
        delegate?.triggerPopUp()
    }
    

}
