//
//  Entity.swift
//  TravelGuide


import Foundation
struct HomeCellViewModel{
    
    var id:String?
    var title:String?
    var category:String?
    var description:String?
    var imageUrl:String?
}

// MARK: -TopPickCellViewModel
struct TopPickCellViewModel:Decodable {
    let date, localName, name: String
    let countryCode: String?
    let fixed, global: Bool
    let counties: [String]?
    let launchYear: Int?
    let type: String?
    var imageUrl:String?
    var id:String?
}


