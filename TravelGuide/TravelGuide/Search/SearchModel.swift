//
//  SearchModel.swift
//  TravelGuide


import Foundation
import Alamofire
//Protocol was used to transfer the data from the API to the viewModel
protocol SearchModelProtocol:AnyObject{
    func didSearchFetchProcessFinish(_ isSuccess:Bool)
}

class SearchModel{


    var hotelsSearch:[EntityHotel] = []
    
    //Notifies ViewModel
    weak var delegateSearch:SearchModelProtocol?
    var searchList:[SearchCellViewModel] = []
    var searchflights:[Datum] = []
    var searchFlightsItemList:[Datum] = []
    
    
    //conversion process
    private func transformFlightsToCellModel(_ flights:[Datum])->[SearchCellViewModel]{
        
        return flights.map{.init(id:$0.price,title:$0.destination,description: $0.destination,imageUrl: $0.imageUrl)}
    }
    
    //conversion process
    private func transformHotelsToCellModel(_ hotels:[EntityHotel])->[SearchCellViewModel]{
        
        return hotels.map{.init(id:Int($0.destinationId!),title:$0.name,description: $0.caption,imageUrl: $0.imageUrl)}
    }
    func filterUpdateData(selectButton:String,textDidChange searchText: String){
        if (searchText.count >= 3){
            if selectButton == "flights"{
                searchList.removeAll()
                let timerFlights = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [self] timerFlights in
                    
                    timerFlights.invalidate()
                    searchList = transformFlightsToCellModel(searchflights).filter{$0.title!.lowercased().contains(searchText.lowercased())}
                    if searchList.count>0{
                        self.delegateSearch?.didSearchFetchProcessFinish(true)
                    }
                    else{
                        self.delegateSearch?.didSearchFetchProcessFinish(false)
                    }
              
                }
                
             
            }
            else if (selectButton == "hotels"){
               
                searchList.removeAll()
                let timerHotels = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [self] timerHotels in
                    
                    timerHotels.invalidate()
                    
                    searchList = transformHotelsToCellModel(hotelsSearch).filter{$0.title!.lowercased().contains(searchText.lowercased())}
                  
                    if hotelsSearch.count>0{
                        self.delegateSearch?.didSearchFetchProcessFinish(true)
                    }
                    else{
                        self.delegateSearch?.didSearchFetchProcessFinish(false)
                    }
              
                }
            }else{
                self.delegateSearch?.didSearchFetchProcessFinish(false)
            }
        }else{
            self.delegateSearch?.didSearchFetchProcessFinish(false)
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
