//
//  Extension-MainVC-TableView.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation
import UIKit

extension MainVC : UITableViewDelegate {
    
}

extension MainVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: InputNameCell.reusableID, for: indexPath) as! InputNameCell
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TakeSalfieCell.reusableID, for: indexPath) as! TakeSalfieCell
            cell.delegate = self
            return cell
        case 2:
            break
        default:
            break
        }
        return UITableViewCell()
    }
    
    
}
