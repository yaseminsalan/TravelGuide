//
//  DetailViewModel.swift
//  TravelGuide


import Foundation

//We notified the View with the delegate structure
protocol DetailViewModelViewProtocol:AnyObject{
    //informs view
    func didCellItemFetch()

}
class DetailViewModel{
    var model:DetailModel
    
    weak var viewDelegateDetail:DetailViewModelViewProtocol?
    init(model: DetailModel) {
        self.model = model
    }
    func didViewLoad(){
        model.fetchData()
    }
    func didSaveCoreData(){
        model.saveDataWithCoreData()
    }
    func didDeleteCoreData(){
        model.deleteDataWithCoreData()
    }
}
//MARK:-
extension DetailViewModel:DetailModelProtocol{
    func didDetailFetchProcessFinish(_ isSuccess: Bool) {
  
    
    
        if isSuccess{
        
            viewDelegateDetail?.didCellItemFetch()
           
        }
        else{
         
        }


        

      
        
    }
}
