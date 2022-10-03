//
//  Entity.swift
//  TravelGuide


import Foundation
struct FlightsCellViewModel{
    
    var id:Int?
    var name:String?
    var title:String?
    var category:String?
    var description:String?
    var image:String?
}

struct Flights:Decodable{
    var albumId:Int?
    var id:Int?
    var title:String?
    var url:String?
    var thumbnailUrl:String?
   
}
