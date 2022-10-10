//
//  HomeViewModel.swift
//  TravelGuide


import Foundation
//We notified the View with the delegate structure
protocol HomeViewModelViewProtocol:AnyObject{
    //informs view
    func didCellItemFetch()
    func navigateToDetail(_ detailItem:DetailCellViewModel)
}
class HomeViewModel{
    //ViewModel has to keep the Model I, for this we created a model list
    private let model = HomeModel()
    
    weak var viewDelegate:HomeViewModelViewProtocol?
  
    
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
        return model.articles.count
    }
    func getModel(at index:Int) -> HomeCellViewModel{
        return  transformArticleToCellModel(model.articles[index])
    }
    //for the communication of the clicked cells
    func didClickItem(at index:Int){
        //TODO
        let selectedItem = model.articles[index]
        viewDelegate?.navigateToDetail(DetailCellViewModel(id:Int(selectedItem.id!),title: selectedItem.name,category: selectedItem.type,description: selectedItem.localName,imageUrl: selectedItem.imageUrl,pageCategory: "toppick",bookmarksControl: false))
        
    }
    //conversion was done
    private func transformArticleToCellModel(_ article:TopPickCellViewModel)->HomeCellViewModel{
        return .init(id: article.id,title: article.name,category: article.type,description: article.date,imageUrl: article.imageUrl)
    }
}


//MARK:-HomeModelProtocol
extension HomeViewModel:HomeModelProtocol{
    //We'll get word Data's been pulled.
    func didFetchProcessFinish(_ isSuccess: Bool) {
    
        if isSuccess{
        
            viewDelegate?.didCellItemFetch()
    
        }
        else{
           
        }


      
        
    }
}
