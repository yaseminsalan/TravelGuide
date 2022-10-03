//
//  HotelsViewModel.swift
//  TravelGuide
//
//  Created by amarenasoftware on 3.10.2022.
//

import Foundation
//We notified the View with the delegate structure
protocol HotelsViewModelViewProtocol:AnyObject{
    //view e haber verir
    func didCellItemFetch()
    func showEmptyView()
    func hideEmptyView()
    func navigateToDetail(_ id:Int)
}
class HotelsViewModel{
    //ViewModel has to keep the Model I, for this we created a model list
    private let model = HotelsModel()
    
    weak var viewDelegate:HotelsViewModelViewProtocol?
  
    
    init(){
        //We have delegated the model in Model to receive news from Model
        model.delegate = self
    }
    
    //Informs us that the ViewController is loaded and we can now pull data from the API and perform operations.
    func didViewLoad(){
        model.fetchData()
    }
    
    func numberOfSections()->Int{1}
    
    func numberOfItems()->Int{
        return model.hotels.count
    }
    func getModel(at index:Int) -> HotelsCellViewModel{
        return  transformFlightsToCellModel(model.hotels[index])
    }
    //for the communication of the clicked cells
    func didClickItem(at index:Int){
        //TODO
        let selectedItem = model.hotels[index]
        viewDelegate?.navigateToDetail(selectedItem.id!)
        
    }
    //dönüştüme işlemini supfunksiyona atadık
    private func transformFlightsToCellModel(_ flights:Hotels)->HotelsCellViewModel{
        return .init(title:flights.title,category: flights.title)
    }
}



//MARK:-
extension HotelsViewModel:HotelsModelProtocol{
    func didHotelsFetchProcessFinish(_ isSuccess: Bool) {
    
    
        if isSuccess{
          //  let articles = model.articles
          //  let cellModels = makeViewBaseModel(articles)
            viewDelegate?.didCellItemFetch()
            viewDelegate?.hideEmptyView()
        }
        else{
            viewDelegate?.showEmptyView()
        }


        //TODO:
        

      
        
    }
}
