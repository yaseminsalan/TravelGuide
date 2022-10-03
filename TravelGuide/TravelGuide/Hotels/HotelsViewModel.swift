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
    func navigateToDetail(_ detailItem:DetailCellViewModel)
}
class HotelsViewModel{
    //ViewModel has to keep the Model I, for this we created a model list
    private let modelHotels = HotelsModel()
    
    weak var viewDelegateHotels:HotelsViewModelViewProtocol?
  
    
    init(){
        //We have delegated the model in Model to receive news from Model
        modelHotels.delegate = self
    }
    
    //Informs us that the ViewController is loaded and we can now pull data from the API and perform operations.
    func didViewLoad(){
        modelHotels.fetchHotelsData()
    }
    
    func numberOfSections()->Int{1}
    
    func numberOfItems()->Int{
        return modelHotels.hotels.count
    }
    func getModel(at index:Int) -> HotelsCellViewModel{
        return  transformHotelsToCellModel(modelHotels.hotels[index])
    }
    //for the communication of the clicked cells
    func didClickItem(at index:Int){
        //TODO
        let selectedItem = modelHotels.hotels[index]
        viewDelegateHotels?.navigateToDetail(DetailCellViewModel(id:Int(selectedItem.destinationId!),title: selectedItem.name,category: selectedItem.type,description: selectedItem.caption,imageUrl: "",pageCategory: "Hotels",bookmarksControl: false))
        
    }
    //dönüştüme işlemini supfunksiyona atadık
    private func transformHotelsToCellModel(_ hotels:EntityHotel)->HotelsCellViewModel{
        return .init(id:Int(hotels.destinationId!),title:hotels.name,category: hotels.type,description: hotels.caption)
    }
}



//MARK:-
extension HotelsViewModel:HotelsModelProtocol{
    func didHotelsFetchProcessFinish(_ isSuccess: Bool) {
    
    
        if isSuccess{
        
            viewDelegateHotels?.didCellItemFetch()
            viewDelegateHotels?.hideEmptyView()
        }
        else{
            viewDelegateHotels?.showEmptyView()
        }


        

      
        
    }
}
