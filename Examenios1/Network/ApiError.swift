//
//  ApiError.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation

enum ApiError: Int, Error {
    case unauthorized           //Status code 401
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case nilResponse            //Error when response are nil
    case unknownError
}
