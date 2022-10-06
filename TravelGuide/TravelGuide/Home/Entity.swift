//
//  Entity.swift
//  TravelGuide


import Foundation
struct HomeCellViewModel{
    
    var id:Int?
    var title:String?
    var category:String?
    var image:String?
}

struct TopPickCellViewModel:Decodable{
    var albumId:Int?
    var id:Int?
    var title:String?
    var url:String?
    var thumbnailUrl:String?
   
}
// MARK: - Welcome10
struct Welcomedeneme:Decodable {
    let pagination: Pagination
    let data: [ArticlesDatum]
}

// MARK: - Datum
struct ArticlesDatum:Decodable {
    let author, title, datumDescription: String
    let url: String
    let source: String
    let image: String
    let category, language, country: String
    let publishedAt: Date
}

// MARK: - Pagination
struct Pagination:Decodable {
    let limit, offset, count, total: Int
}
