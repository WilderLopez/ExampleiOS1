//
//  ColorExtension.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

extension UIColor {
  
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}

class UIColourScheme {
    
    static let instance = UIColourScheme()
    var bgColour = UIColor.black
    
    let rootRef = Database.database().reference()
    
    func set(for viewController: UIViewController) {
        
        let backColorRef = rootRef.child("BackgroundColor")
        
        backColorRef.observe(.value) { (snap: DataSnapshot) in
            
            guard let colorhex = snap.value as? String else {return}
            
            print("background color changed from firebase to: \(colorhex)")
            
            viewController.view.backgroundColor = UIColor(colorhex)
            
        }
    }
    
}
