//
//  HomeViewModel.swift
//  TravelGuide
//
//  Created by amarenasoftware on 28.09.2022.
//

import Foundation
//We notified the View with the delegate structure
protocol HomeViewModelViewProtocol:AnyObject{
    //view e haber verir
    func didCellItemFetch()
    func showEmptyView()
    func hideEmptyView()
    func navigateToDetail(_ id:Int)
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
        viewDelegate?.navigateToDetail(selectedItem.id!)
        
    }
    //dönüştüme işlemini supfunksiyona atadık
    private func transformArticleToCellModel(_ article:TopPickCellViewModel)->HomeCellViewModel{
        return .init(title: article.title,image: article.thumbnailUrl)
    }
}

/*private extension HomeViewModel{
    //we wanted to say that in some cases I will not use it
    @discardableResult
    func makeViewBaseModel(_ articles:[TopPickCellViewModel]) -> [HomeCellViewModel]{
        //we use it to translate the data from the model into the desired structure of the cell
        return articles.map{.init(id:$0.id,title: $0.title)}
    }
}*/

//MARK:-CommentsModelProtocol
extension HomeViewModel:HomeModelProtocol{
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