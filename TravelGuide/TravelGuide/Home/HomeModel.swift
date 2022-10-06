//
//  HomeModel.swift
//  TravelGuide

import Foundation
import Alamofire
//Protocol was used to transfer the data from the API to the viewModel
protocol HomeModelProtocol:AnyObject{
    func didFetchProcessFinish(_ isSuccess:Bool)
}

class HomeModel{
    //Notifies ViewModel
    weak var delegate:HomeModelProtocol?
    var articles:[ArticlesDatum] = []
    func fetchData(){
        print("deneme artıclefonk")
        let parameters: Parameters = [
              "access_key": "5a9a6a11f9a68a468b700adfb0ebc7a9",
              "keywords" : "technology",
              "countries" :"us,gb,de",
               
              ]
        
        AF.request("http://api.mediastack.com/v1/news?access_key=5a9a6a11f9a68a468b700adfb0ebc7a9&keywords=technology&countries=us,gb,de").responseDecodable(of:Welcomedeneme.self){(res) in
            
            
          //  self.articles = res.value?.data ?? []
            print("deneme artıcle\(res)")
            self.delegate?.didFetchProcessFinish(true)
        }
    }
 
}
