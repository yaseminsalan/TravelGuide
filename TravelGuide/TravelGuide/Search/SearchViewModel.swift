//
//  SearchViewModel.swift
//  TravelGuide

import Foundation
//We notified the View with the delegate structure
protocol SearchViewModelViewProtocol:AnyObject{
    //informs view
    func didCellItemFetch()
    func showEmptyView()
    func hideEmptyView()
    func navigateToDetail(_ detailItem:DetailCellViewModel)
}
class SearchViewModel{
    //ViewModel has to keep the Model I, for this we created a model list
    private let modelSearch = SearchModel()
    
    weak var viewDelegateSearch:SearchViewModelViewProtocol?
    
    
    init(){
        //We have delegated the model in Model to receive news from Model
        modelSearch.delegateSearch = self
    }
    
    //Informs us that the ViewController is loaded and we can now pull data from the API and perform operations.
    func didViewLoad(){
        modelSearch.fetchFlightsSearchData()
        modelSearch.fetchHotelsSearchData()
     
    }
    
    func numberOfSections()->Int{1}
    
    func numberOfItems()->Int{
        return modelSearch.searchList.count
    }
    func getDataUpdate(selectButton:String,textDidChange searchText: String){
        modelSearch.filterUpdateData(selectButton:selectButton,textDidChange:searchText)

    }
    func getModel(at index:Int) -> SearchCellViewModel{
        return  modelSearch.searchList[index]
    }
    //for the communication of the clicked cells
    func didClickItem(at index:Int){
        //TODO
        let selectedItem = modelSearch.searchList[index]
        viewDelegateSearch?.navigateToDetail(DetailCellViewModel(id:Int(selectedItem.id!),title: selectedItem.title,category: selectedItem.category,description: selectedItem.description,imageUrl:selectedItem.imageUrl,pageCategory: "Search",bookmarksControl: false))
        
    }
}



//MARK:-
extension SearchViewModel:SearchModelProtocol{
    func didSearchFetchProcessFinish(_ isSuccess: Bool) {
  
        if isSuccess{
        
            viewDelegateSearch?.didCellItemFetch()
            viewDelegateSearch?.hideEmptyView()
         
        }
        else{
         
            viewDelegateSearch?.showEmptyView()
        }


        

      
        
    }
}
