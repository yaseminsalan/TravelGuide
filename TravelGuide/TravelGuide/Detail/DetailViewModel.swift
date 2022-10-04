//
//  DetailViewModel.swift
//  TravelGuide


import Foundation

//We notified the View with the delegate structure
protocol DetailViewModelViewProtocol:AnyObject{
    //view e haber verir
    func didCellItemFetch()
    func showEmptyView()
    func hideEmptyView()

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
}
//MARK:-
extension DetailViewModel:DetailModelProtocol{
    func didDetailFetchProcessFinish(_ isSuccess: Bool) {
  
    
    
        if isSuccess{
        
            viewDelegateDetail?.didCellItemFetch()
            viewDelegateDetail?.hideEmptyView()
        }
        else{
            viewDelegateDetail?.showEmptyView()
        }


        

      
        
    }
}
