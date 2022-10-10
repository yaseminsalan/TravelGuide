//
//  BookmarksModel.swift
//  TravelGuide


import Foundation
import CoreData

//Protocol was used to transfer the data from the API to the viewModel
protocol BookmarksModelProtocol:AnyObject{
    func didBookmarksFetchProcessFinish(_ isSuccess:Bool)
}

class BookmarksModel{
    //Notifies ViewModel
    weak var delegateBookmarks:BookmarksModelProtocol?
    var bookmarksList:[BookmarksCellViewModel] = []
    func fetchData(){
        let fetchRequest:NSFetchRequest<BookmarkData> = BookmarkData.fetchRequest()
        
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
           
           
   
            for i in 0..<results.count{
                bookmarksList.append(BookmarksCellViewModel(id: Int(bitPattern: results[i].id),title: results[i].title,category: results[i].category,description: results[i].explanation,imageUrl: results[i].imageURL,date:results[i].date))
            }
           
            self.delegateBookmarks?.didBookmarksFetchProcessFinish(true)
            
        }catch{
            print(error.localizedDescription)
            self.delegateBookmarks?.didBookmarksFetchProcessFinish(false)
        }
        
        
        
    

    }
}
