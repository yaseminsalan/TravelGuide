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
    var flights:[Flights] = []
    func fetchData(){
         
        
        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of:[Flights].self){(res) in
            
            guard let items = res.value else {
                self.delegate?.didFetchProcessFinish(false)
                return
            }
         
            self.flights = items
            self.delegate?.didFetchProcessFinish(true)
        }
    }
 
}
