//
//  HotelsEntity.swift
//  TravelGuide
//
//  Created by amarenasoftware on 3.10.2022.
//

import Foundation
struct HotelsCellViewModel{
    
    var id:Int?
    var title:String?
    var category:String?
    var description:String?
    var imageUrl:String?
}


// MARK: - Hotels
struct Hotels:Decodable {
    let term: String?
    let moresuggestions: Int?
    let autoSuggestInstance: String?
    let trackingID: String?
    let misspellingfallback: Bool?
    let suggestions: [Suggestion]
    let geocodeFallback: Bool?
}

// MARK: - Suggestion
struct Suggestion:Decodable {
    let group: String?
    let entities: [EntityHotel]
}

// MARK: - Entity
struct EntityHotel:Decodable {
    let geoId, destinationId: String?
    let landmarkCityDestinationId: String?
    let type: String?
    let redirectPage: String?
    let latitude, longitude: Double?
    let searchDetail: String?
    let caption:String?
    let name: String?
    let imageUrl:String?
}


