//
//  HomeModel.swift
//  TravelGuide
//
//  Created by amarenasoftware on 28.09.2022.
//

import Foundation
import Alamofire
//Protocol was used to transfer the data from the API to the viewModel
protocol HomeModelProtocol:AnyObject{
    func didFetchProcessFinish(_ isSuccess:Bool)
}

class HomeModel{
    //Notifies ViewModel
    weak var delegate:HomeModelProtocol?
    var articles:[TopPickCellViewModel] = []
    func fetchData(){
         
        
        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of:[TopPickCellViewModel].self){(res) in
            
            guard let items = res.value else {
                self.delegate?.didFetchProcessFinish(false)
                return
            }
         
            self.articles = items
            self.delegate?.didFetchProcessFinish(true)
        }
    }
 
}
