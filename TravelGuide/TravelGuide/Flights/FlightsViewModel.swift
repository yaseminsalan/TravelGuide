//
//  FlightsViewModel.swift
//  TravelGuide


import Foundation
//We notified the View with the delegate structure
protocol FlightsViewModelViewProtocol:AnyObject{
    //view e haber verir
    func didCellItemFetch()
    func showEmptyView()
    func hideEmptyView()
    func navigateToDetail(_ id:Int)
}
class FlightsViewModel{
    //ViewModel has to keep the Model I, for this we created a model list
    private let model = FlightsModel()
    
    weak var viewDelegate:FlightsViewModelViewProtocol?
  
    
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
        return model.flights.count
    }
    func getModel(at index:Int) -> FlightsCellViewModel{
        return  transformFlightsToCellModel(model.flights[index])
    }
    //for the communication of the clicked cells
    func didClickItem(at index:Int){
        //TODO
        let selectedItem = model.flights[index]
        viewDelegate?.navigateToDetail(selectedItem.id!)
        
    }
    //dönüştüme işlemini supfunksiyona atadık
    private func transformFlightsToCellModel(_ flights:Flights)->FlightsCellViewModel{
        return .init(title:flights.title,category: flights.title)
    }
}



//MARK:-
extension FlightsViewModel:FlightsModelProtocol{
    //We'll get word Data's been pulled.
    func didFetchProcessFinish(_ isSuccess: Bool) {
    
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
