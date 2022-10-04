//
//  BookmarksViewModel.swift
//  TravelGuide
//
//  Created by amarenasoftware on 4.10.2022.
//

import Foundation
//We notified the View with the delegate structure
protocol BookmarksViewModelViewProtocol:AnyObject{
    //view e haber verir
    func didCellItemFetch()
    func showEmptyView()
    func hideEmptyView()
    func navigateToDetail(_ detailItem:DetailCellViewModel)
}
class BookmarksViewModel{
    //ViewModel has to keep the Model I, for this we created a model list
    private let modelBookmarks = BookmarksModel()
    
    weak var viewDelegateBookmarks:BookmarksViewModelViewProtocol?
  
    
    init(){
        //We have delegated the model in Model to receive news from Model
        modelBookmarks.delegateBookmarks = self
    }
    
    //Informs us that the ViewController is loaded and we can now pull data from the API and perform operations.
    func didViewLoad(){
        modelBookmarks.fetchData()
    }
    
    func numberOfSections()->Int{1}
    
    func numberOfItems()->Int{
        return modelBookmarks.bookmarksList.count
    }
    func getModel(at index:Int) -> BookmarksCellViewModel{
        return  transformBookmarksToCellModel(modelBookmarks.bookmarksList[index])
    }
    //for the communication of the clicked cells
    func didClickItem(at index:Int){
        //TODO
        let selectedItem = modelBookmarks.bookmarksList[index]
        viewDelegateBookmarks?.navigateToDetail(DetailCellViewModel(id:selectedItem.id!,title: selectedItem.title,category: selectedItem.category,description: selectedItem.description,imageUrl: "",pageCategory: "Bookmarks",bookmarksControl: false))
        
    }
    //dönüştüme işlemini supfunksiyona atadık
    private func transformBookmarksToCellModel(_ bookmarks:BookmarksCellViewModel)->BookmarksCellViewModel{
        return .init(id: bookmarks.id,title: bookmarks.title,category: bookmarks.category,description: bookmarks.description,imageUrl: bookmarks.imageUrl,date: bookmarks.date)
    }
}



//MARK:-
extension BookmarksViewModel:BookmarksModelProtocol{
    func didBookmarksFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess{
        
            viewDelegateBookmarks?.didCellItemFetch()
            viewDelegateBookmarks?.hideEmptyView()
        }
        else{
            viewDelegateBookmarks?.showEmptyView()
        } 
    }
}
