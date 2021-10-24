//
//  QuestionCell.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit

class QuestionCell: UITableViewCell {
    static let reusableID = "QuestionCellID"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var circleView : UIView!
    @IBOutlet weak var chartDataStackView : UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
