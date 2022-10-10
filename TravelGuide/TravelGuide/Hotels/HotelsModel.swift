//
//  HotelsModel.swift
//  TravelGuide


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
        
           
            
            if ((res.value?.suggestions[1].entities.count)!>0){
                for i in 0..<((res.value?.suggestions[1].entities.count)!){
                    self.hotels.append(EntityHotel(geoId: res.value?.suggestions[1].entities[i].geoId, destinationId: res.value?.suggestions[1].entities[i].destinationId, landmarkCityDestinationId: res.value?.suggestions[1].entities[i].landmarkCityDestinationId, type: res.value?.suggestions[1].entities[i].type, redirectPage: res.value?.suggestions[1].entities[i].redirectPage, latitude: res.value?.suggestions[1].entities[i].latitude, longitude: res.value?.suggestions[1].entities[i].longitude, searchDetail: res.value?.suggestions[1].entities[i].searchDetail, caption: res.value?.suggestions[1].entities[i].caption, name: res.value?.suggestions[1].entities[i].name, imageUrl: String.imageName()))
                }
            }
            else{
                self.delegate?.didHotelsFetchProcessFinish(false)
            }
           
         
            self.delegate?.didHotelsFetchProcessFinish(true)
        }
    }
 
}
