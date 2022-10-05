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
    func navigateToDetail(_ detailItem:DetailCellViewModel)
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
        viewDelegate?.navigateToDetail(DetailCellViewModel(id:selectedItem.price,title: selectedItem.origin,category: "",description: selectedItem.destination,imageUrl:selectedItem.imageUrl,pageCategory: "Flights",bookmarksControl: false))
        
    }
    //dönüştüme işlemini supfunksiyona atadık
    private func transformFlightsToCellModel(_ flights:Datum)->FlightsCellViewModel{
        return .init(id:flights.price,title: flights.origin,description: flights.destination,imageUrl: flights.imageUrl)
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
