//
//  FlightsModel.swift
//  TravelGuide


import Foundation
import Alamofire
//Protocol was used to transfer the data from the API to the viewModel
protocol FlightsModelProtocol:AnyObject{
    func didFetchProcessFinish(_ isSuccess:Bool)
}

class FlightsModel{
    //Notifies ViewModel
    weak var delegate:FlightsModelProtocol?
    var flights:[Datum] = []
 
  
    func fetchData(){
         
        
       
        
        
        
        let headers:HTTPHeaders = [
            "X-Access-Token": "acd117f9e11c49645db59cff45150a5f",
            "X-RapidAPI-Key": "2cb2e127e9msh641ac0e6d2c005ap18d842jsn8b896cdbd0ca",
            "X-RapidAPI-Host": "travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com"
        ]
        AF.request("https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/v1/prices/calendar?calendar_type=departure_date&destination=IST&origin=ESB&depart_date=2020-06&currency=RUB&length=5",headers:headers).responseDecodable(of:Welcome10.self){(res) in
            
            guard let items = res.value?.data?.values else {
                self.delegate?.didFetchProcessFinish(false)
                return
            }
            
           
         
            self.flights = items.reversed()
          
            self.delegate?.didFetchProcessFinish(true)
        }
        
        
        
        
        
    }
 
}
