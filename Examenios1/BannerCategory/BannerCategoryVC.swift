//
//  BannerCategoryVC.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import UIKit

class BannerCategoryVC: UIViewController {

    var bannerCategoryViewModel : BannerCategoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Agregar en todos los VC
        UIColourScheme.instance.set(for:self)
        
        bannerCategoryViewModel = .init(delegate: self)
        bannerCategoryViewModel?.getBannerCategory()
    }
    
}


extension BannerCategoryVC : BannerCaterogyProtocol {
    func getBannerCategoryResponse(banner: BannerCategory) {
        print("all banners: \(banner)")
    }
    
    
}
