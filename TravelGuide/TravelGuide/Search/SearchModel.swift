//
//  SearchModel.swift
//  TravelGuide
//
//  Created by Amarena Software on 6.10.2022.
//

import Foundation
import Alamofire
//Protocol was used to transfer the data from the API to the viewModel
protocol SearchModelProtocol:AnyObject{
    func didSearchFetchProcessFinish(_ isSuccess:Bool)
}

class SearchModel{
    
    //Notifies ViewModel
    weak var delegateSearchFlights:SearchModelProtocol?
    var searchList:[SearchCellViewModel] = []
    var searchflights:[Datum] = []
    var searchFlightsItemList:[Datum] = []
    
    
    func filterUpdateData(filterdata:[SearchCellViewModel]){
        searchList = filterdata
        if searchList.count>0{
            self.delegate?.didSearchFetchProcessFinish(true)
        }
        else{
            self.delegate?.didSearchFetchProcessFinish(false)
        }
        
    }
    func fetchFlightsSearchData(){
        
        let headers:HTTPHeaders = [
            "X-Access-Token": "acd117f9e11c49645db59cff45150a5f",
            "X-RapidAPI-Key": "2cb2e127e9msh641ac0e6d2c005ap18d842jsn8b896cdbd0ca",
            "X-RapidAPI-Host": "travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com"
        ]
        AF.request("https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/v1/prices/calendar?calendar_type=departure_date&destination=IST&origin=ESB&depart_date=2020-06&currency=RUB&length=5",headers:headers).responseDecodable(of:Flights.self){(res) in
            
            guard let items = res.value?.data?.values else {
              
                return
            }
            self.searchFlightsItemList =  items.reversed()
            if (self.searchFlightsItemList.count>0){
                for j in 0..<(self.searchFlightsItemList.count){
                        
                    self.searchflights.append(Datum(origin: self.searchFlightsItemList[j].origin,destination:self.searchFlightsItemList[j].destination,price:self.searchFlightsItemList[j].price,airline:self.searchFlightsItemList[j].airline,flightNumber:self.searchFlightsItemList[j].flightNumber,departureAt:self.searchFlightsItemList[j].departureAt,returnAt:self.searchFlightsItemList[j].returnAt,transfers:self.searchFlightsItemList[j].transfers,expiresAt:self.searchFlightsItemList[j].expiresAt,imageUrl: String.imageName()))
                    }
       
                }
                else{
        
                }
                
                
              
           
        }
        
    
        
        
        
    }
 
    
    
    
    //Notifies ViewModel
    weak var delegate:SearchModelProtocol?
    var hotelsSearch:[EntityHotel] = []
    func fetchHotelsSearchData(){
         
        
        let headers:HTTPHeaders = [
            "X-RapidAPI-Key": "2cb2e127e9msh641ac0e6d2c005ap18d842jsn8b896cdbd0ca",
            "X-RapidAPI-Host": "hotels4.p.rapidapi.com"
        ]
        AF.request("https://hotels4.p.rapidapi.com/locations/v2/search?query=ankara&locale=tr_TR&currency=Turkey",headers:headers).responseDecodable(of:Hotels.self){(res) in
        
           
            
            if ((res.value?.suggestions[1].entities.count)!>0){
                for i in 0..<((res.value?.suggestions[1].entities.count)!){
                    self.hotelsSearch.append(EntityHotel(geoId: res.value?.suggestions[1].entities[i].geoId, destinationId: res.value?.suggestions[1].entities[i].destinationId, landmarkCityDestinationId: res.value?.suggestions[1].entities[i].landmarkCityDestinationId, type: res.value?.suggestions[1].entities[i].type, redirectPage: res.value?.suggestions[1].entities[i].redirectPage, latitude: res.value?.suggestions[1].entities[i].latitude, longitude: res.value?.suggestions[1].entities[i].longitude, searchDetail: res.value?.suggestions[1].entities[i].searchDetail, caption: res.value?.suggestions[1].entities[i].caption, name: res.value?.suggestions[1].entities[i].name, imageUrl: String.imageName()))
                }
            }
            else{

            }
           
         

        }
    }
 
}
