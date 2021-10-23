//
//  Extension-VC.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showBasicAlert(title: String, message: String){
        let alertController: UIAlertController = {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            controller.addAction(action)
            return controller
        }()
        self.present(alertController, animated: true)
    }
}
