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
    var articles:[TopPickCellViewModel] = []
    func fetchData(){
        
        let headers:HTTPHeaders = [
            "X-RapidAPI-Key": "2cb2e127e9msh641ac0e6d2c005ap18d842jsn8b896cdbd0ca",
            "X-RapidAPI-Host": "public-holiday.p.rapidapi.com"
        ]
        AF.request("https://public-holiday.p.rapidapi.com/2020/US",headers:headers).responseDecodable(of:[TopPickCellViewModel].self){ [self](res) in
            
            
            if ((res.value!.count)>0){
                for i in 0..<((res.value?.count)!){
                    self.articles.append(TopPickCellViewModel(date: res.value![i].date, localName: res.value![i].localName, name: res.value![i].name, countryCode: res.value![i].countryCode, fixed: res.value![i].fixed, global: res.value![i].global, counties: res.value![i].counties, launchYear: res.value![i].launchYear, type: res.value![i].type,imageUrl: String.imageName(),id: UUID().uuidString))
                }
            }
            else{
                self.delegate?.didFetchProcessFinish(false)
            }
           
         
            self.delegate?.didFetchProcessFinish(true)
        }
    }
        
        

}
