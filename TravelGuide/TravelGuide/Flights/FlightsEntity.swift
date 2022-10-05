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


// MARK: - Welcome10
struct Flights:Decodable {
    var success: Bool?
    var data: [String: Datum]?
    var currency: String?
}

// MARK: - Datum
struct Datum:Decodable {
    var origin: String?
    var destination: String?
    var price: Int?
    var airline: String?
    var flightNumber: Int?
    var departureAt, returnAt: Date?
    var transfers: Int?
    var expiresAt: Date?
    var imageUrl:String?
}


