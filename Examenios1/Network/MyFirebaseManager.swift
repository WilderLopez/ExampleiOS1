//
//  MyFirebaseManager.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

class MyFirebaseManager {
    static let share = MyFirebaseManager()
    var db : Firestore
    var storage : Storage
    
    init(){
        self.db = Firestore.firestore()
        self.storage = Storage.storage()
    }
    
    func addUserInfo(username: String, imagePath: String, completion: @escaping (_ isSuccess: Bool) -> Void){
        
        var ref: DocumentReference? = nil
        
        ref = db.collection("users").addDocument(data: [
            "username" : username,
            "firestoreURL" : imagePath]){ err in
                
                if let err = err {
                        print("Error adding document: \(err)")
                        completion(false)
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                        completion(true)
                    }
            }
    }
    
    func uploadImage(path: String, imageData: Data, completion: @escaping (_ isSuccess: Bool) -> Void) {
        
        let storageRef = storage.reference()
        
        let imageRef = storageRef.child(path)
        
        let uploadTask = imageRef.putData(imageData, metadata: nil){ (metadata , error) in
            
            guard let metadata = metadata else {
                print("error: \(error.debugDescription)")
                completion(false)
                return
              }
            print("metadata: \(metadata)")
            completion(true)
        }
    }
    
}
