//
//  MainVC.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit
import Firebase
import FirebaseDatabase


class MainVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    @IBOutlet weak var btn_uploadUserInfo : UIButton!
    
    var username: String?
    var selfie : UIImage?
    
    var userDataViewModel : UserDataViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainTableView.delegate = self
        mainTableView.dataSource = self
    
        mainTableView.keyboardDismissMode = .onDrag
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Agregar en todos los VC
        UIColourScheme.instance.set(for:self)
        self.userDataViewModel = .init(delegate: self)
    }
    
    @IBAction func UploadDataToFirestore(_ sender: Any) {
        
        guard let username = username else {
            print("Alert: username is nil")
            showBasicAlert(title: "Alerta", message: "La informacion del usuario es nula")
            return
        }
        
        guard let selfie = selfie else {
            print("Alert: no photo selected")
            showBasicAlert(title: "Alerta", message: "No se ha seleccionado una foto")
            return
        }
        
        if let imageData = selfie.pngData() {
            self.userDataViewModel?.uploadUserData(username: username, imageData: imageData)
        }
        
    }
    
    

}

extension MainVC : SaveNameCellDelegate {
    func getTextFieldString(string: String) {
        print("save name: \(string)")
        self.username = string
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


extension MainVC : UserDataDelegate {
    
    func uploadUserData(isSuccess: Bool) {
        if isSuccess{
            print("data upload success")
            showBasicAlert(title: "Informacion actualizada", message: "Se subió correctamente la información a Firebase")
        }else {
            print("data upload fail")
            showBasicAlert(title: "Error", message: "Ha ocurrido un error al subir la información a Firebase")
        }
    }
    
    
}
