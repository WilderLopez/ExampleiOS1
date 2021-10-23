//
//  SelfieDetailVC.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit

class SelfieDetailVC: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    
    var selfieImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imageView.image = selfieImage
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Agregar en todos los VC
        UIColourScheme.instance.set(for:self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
