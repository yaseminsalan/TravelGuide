//
//  HomeModel.swift
//  TravelGuide
//
//  Created by amarenasoftware on 28.09.2022.
//

import Foundation
//Protocol was used to transfer the data from the API to the viewModel
protocol HomeModelProtocol:AnyObject{
    func didFetchProcessFinish(_ isSuccess:Bool)
}

class HomeModel{
    //Notifies ViewModel
    weak var delegate:HomeModelProtocol?
    var articles:[TopPickCellViewModel] = []
    func fetchData(){
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else {
            //false is returned if the url does not exist or is the wrong url
            delegate?.didFetchProcessFinish(false)
            return
        }
            var request:URLRequest = .init(url: url)
        // We set GET method as http method
       
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request){[weak self]
            data,response,error in
            //is checked for errors
            guard  error == nil else{
                //no data was received because an error was received, therefore false is returned
                self?.delegate?.didFetchProcessFinish(false)
                return
            }
            
            guard let data = data else{
                //Even if there is no error, data may not have arrived, false is returned because there is no data
                self?.delegate?.didFetchProcessFinish(false)
                return
            }
            
            //data arrived without any problems
            do{
                
                //we can convert the incoming data to the class we want
                let jsonDecoder = JSONDecoder()
                //we said convert the data here to the "CommentCellViewModel" array type
                self?.articles =  try  jsonDecoder.decode([TopPickCellViewModel].self, from: data)
                //We notify ViewModel (everything is done, successfully received the data)
                self?.delegate?.didFetchProcessFinish(true)
            }catch{
                self?.delegate?.didFetchProcessFinish(false)
                print("JSON Serialization")
            }
            
        }
        task.resume()

    }
}
