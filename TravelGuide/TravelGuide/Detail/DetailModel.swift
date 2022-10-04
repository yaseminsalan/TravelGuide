//
//  DetailModel.swift
//  TravelGuide


import Foundation
import CoreData
//Protocol was used to transfer the data from the API to the viewModel
protocol DetailModelProtocol:AnyObject{
    func didDetailFetchProcessFinish(_ isSuccess:Bool)
}
class DetailModel{
    
    var detailItem:DetailCellViewModel
    weak var viewModel:DetailViewModel?
    weak var delegate:DetailModelProtocol?
    
    init(detailItem: DetailCellViewModel, viewModel: DetailViewModel? = nil, delegate: DetailModelProtocol? = nil) {
        
        self.detailItem = detailItem
        self.viewModel = viewModel
        self.delegate = delegate
        
    }
    func fetchData(){
        
       // detailItem.title = "deneme"
       // detailItem.bookmarksControl = true
        
        
        
        
        
        
    }
    
    
     func saveDataWithCoreData(){
        
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let data = BookmarkData(context: managedContext)
         data.setValue(Date(), forKey: #keyPath(BookmarkData.date))
         data.setValue(detailItem.category, forKey: #keyPath(BookmarkData.category))
         data.setValue(detailItem.description, forKey: #keyPath(BookmarkData.explanation))
         data.setValue(detailItem.imageUrl, forKey: #keyPath(BookmarkData.imageURL))
         data.setValue(detailItem.title, forKey: #keyPath(BookmarkData.title))
         data.setValue(String(detailItem.id!), forKey: #keyPath(BookmarkData.bookmarkID))
        //we save our created object
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
}
