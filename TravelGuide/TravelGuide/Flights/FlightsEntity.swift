//
//  Entity.swift
//  TravelGuide


import Foundation
struct FlightsCellViewModel{
    var id:Int?
    var title:String?
    var category:String?
    var description:String?
    var imageUrl:String?
}

struct Flights:Decodable{
    var albumId:Int?
    var id:Int?
    var title:String?
    var url:String?
    var thumbnailUrl:String?
   
}
// MARK: - Welcome10
struct Welcome10:Decodable {
    let success: Bool?
    let data: [String: Datum]?
    let currency: String?
}

// MARK: - Datum
struct Datum:Decodable {
    let origin: String?
    let destination: String?
    let price: Int?
    let airline: String?
    let flightNumber: Int?
    let departureAt, returnAt: Date?
    let transfers: Int?
    let expiresAt: Date?
}


