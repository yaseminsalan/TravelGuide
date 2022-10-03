//
//  HotelsModel.swift
//  TravelGuide
//
//  Created by amarenasoftware on 3.10.2022.
//

import Foundation
import Alamofire
//Protocol was used to transfer the data from the API to the viewModel
protocol HotelsModelProtocol:AnyObject{
    func didHotelsFetchProcessFinish(_ isSuccess:Bool)
}

class HotelsModel{
    //Notifies ViewModel
    weak var delegate:HotelsModelProtocol?
    var hotels:[EntityHotel] = []
    func fetchHotelsData(){
         
        
        let headers:HTTPHeaders = [
            "X-RapidAPI-Key": "2cb2e127e9msh641ac0e6d2c005ap18d842jsn8b896cdbd0ca",
            "X-RapidAPI-Host": "hotels4.p.rapidapi.com"
        ]
        AF.request("https://hotels4.p.rapidapi.com/locations/v2/search?query=ankara&locale=tr_TR&currency=Turkey",headers:headers).responseDecodable(of:Hotels.self){(res) in
            
            guard let items = res.value else {
                self.delegate?.didHotelsFetchProcessFinish(false)
                return
            }
            print("deneme\(items.suggestions[1].entities.count)")
            
          
           
            self.hotels = items.suggestions[1].entities
            self.delegate?.didHotelsFetchProcessFinish(true)
        }
    }
 
}
