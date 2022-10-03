//
//  DetailModel.swift
//  TravelGuide


import Foundation
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
    
}
