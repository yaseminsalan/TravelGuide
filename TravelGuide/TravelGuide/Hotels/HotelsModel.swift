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
    var hotels:[Hotels] = []
    func fetchData(){
         
        
        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of:[Hotels].self){(res) in
            
            guard let items = res.value else {
                self.delegate?.didHotelsFetchProcessFinish(false)
                return
            }
         
            self.hotels = items
            self.delegate?.didHotelsFetchProcessFinish(true)
        }
    }
 
}
