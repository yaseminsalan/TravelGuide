//
//  HotelsEntity.swift
//  TravelGuide
//
//  Created by amarenasoftware on 3.10.2022.
//

import Foundation
struct HotelsCellViewModel{
    
    var id:Int?
    var name:String?
    var title:String?
    var category:String?
    var description:String?
    var image:String?
}

struct Hotels:Decodable{
    var albumId:Int?
    var id:Int?
    var title:String?
    var url:String?
    var thumbnailUrl:String?
   
}
