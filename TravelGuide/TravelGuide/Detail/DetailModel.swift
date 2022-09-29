//
//  DetailModel.swift
//  TravelGuide
//
//  Created by amarenasoftware on 29.09.2022.
//

import Foundation
class DetailModel{
    
    private var id:Int
    weak var viewModel:DetailViewModel?
    
    init(id: Int) {
        self.id = id
       
    }
}
