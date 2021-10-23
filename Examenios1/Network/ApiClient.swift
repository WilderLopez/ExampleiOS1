//
//  ApiClient.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation
import Alamofire
import Combine

class ApiClient {
    static let share = ApiClient()
    
    let baseUrl : String = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/"
    
    ///Solo para el test
    let pathUrl : String = "helloWorld/"
    
    let commonHeader : HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    internal func genericRequest<T: Decodable, C: Encodable>(pathUrl: String, header : HTTPHeaders = [:], parameter: C, method: HTTPMethod = .get, encoding: ParameterEncoding = URLEncoding.default) -> Future <T,ApiError>{
        
        Future { promise in
            
            AF.request("\(self.baseUrl)\(pathUrl)", method: method, parameters: parameter.dictionary, encoding: encoding , headers: header).validate().responseJSON { response in
                
                #if DEBUG
                debugPrint(response)
                #endif
                
                switch response.result {
                case .success:
                    guard let data = response.data else{
                        promise(.failure(ApiError.nilResponse))
                        return
                    }
                    if let item = T.decode(data: data){
                        promise(.success(item))
                    }else {
                        promise(.failure(ApiError.nilResponse))
                    }
                    
                case .failure:
                    if let statusCode = response.response?.statusCode{
                        promise(.failure(ApiError(rawValue: statusCode) ?? .unknownError))
                    }
                    promise(.failure(ApiError.unknownError))
                }
            }
        }
    }
}

extension ApiClient {
    
    func fetchBannerCategory(pathUrl: String) -> Future<BannerCategory,ApiError>{
        let emptyParameter : BannerCategory = BannerCategory(colors: [], questions: [])
        
        return genericRequest(pathUrl: pathUrl, parameter: emptyParameter)
    }
    
}
