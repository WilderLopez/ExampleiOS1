//
//  ModelData.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation

//Agrupados las 3 structs en un mismo fichero solo para esta prueba

// MARK: - BannerCategory
struct BannerCategory: Codable {
    let colors: [String]
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let total: Int
    let text: String
    let chartData: [ChartDatum]
}

// MARK: - ChartDatum
struct ChartDatum: Codable {
    let text: String
    let percetnage: Int
}
