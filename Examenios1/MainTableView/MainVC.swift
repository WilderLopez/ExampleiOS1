//
//  MainVC.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var selfie : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.keyboardDismissMode = .onDrag
    }
    

}

extension MainVC : SaveNameCellDelegate {
    func getTextFieldString(string: String) {
        print("save name: \(string)")
    }
}

extension MainVC: TakeSelfieCellDelegate {
    func triggerPopUp() {
        let imagePicker = ImagePickerManager()
        imagePicker.selectedImage = self.selfie
        imagePicker.pickImage(self){ image, isDetail  in
                //here is the image
            self.selfie = image
            
                if isDetail ?? false{
                    self.performSegue(withIdentifier: "SegueSelfieDetails", sender: image)
                }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueSelfieDetails" {
            let vc = segue.destination as! SelfieDetailVC
            vc.selfieImage = sender as? UIImage
        }
    }
}
