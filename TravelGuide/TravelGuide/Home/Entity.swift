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
