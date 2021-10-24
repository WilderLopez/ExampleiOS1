//
//  BannerCategoryViewModel.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation
import Combine

protocol BannerCaterogyProtocol {
    func getBannerCategoryResponse(banner: BannerCategory)
}

class BannerCategoryViewModel {
    var f : AnyCancellable?
    
    var delegate : BannerCaterogyProtocol
    
    init(delegate: BannerCaterogyProtocol){
        self.delegate = delegate
    }
    
    func getBannerCategory(){
        
        f = ApiClient.share.fetchBannerCategory(pathUrl: "helloWorld/").sink(receiveCompletion: { task in
            switch task{
                case .failure(let error):
                print("show error message to the client: \(error)")
                break
            default:
                break
            }
        }, receiveValue: { banner in
            self.delegate.getBannerCategoryResponse(banner: banner)
        })

    }
}
