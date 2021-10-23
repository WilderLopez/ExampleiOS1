//
//  UserDataViewModel.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation
import UIKit

protocol UserDataDelegate {
    func uploadUserData(isSuccess: Bool)
}

class UserDataViewModel {
    
    var delegate : UserDataDelegate?
    
    init(delegate: UserDataDelegate) {
        self.delegate = delegate
    }
    
    func uploadUserData(username: String, imageData: Data){
        let imagePath = "image/\(username).png"
        
        MyFirebaseManager.share.uploadImage(path: imagePath, imageData: imageData) { isSuccess in
            if isSuccess{
                MyFirebaseManager.share.addUserInfo(username: username, imagePath: imagePath) { isSuccess in
                    self.delegate?.uploadUserData(isSuccess: isSuccess)
                }
            }else {
                self.delegate?.uploadUserData(isSuccess: false)
            }
        }
        
    }
    
    
}
