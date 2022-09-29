//
//  DetailModel.swift
//  TravelGuide


import Foundation
class DetailModel{
    
    private var id:Int
    weak var viewModel:DetailViewModel?
    
    init(id: Int) {
        self.id = id
       
    }
}
