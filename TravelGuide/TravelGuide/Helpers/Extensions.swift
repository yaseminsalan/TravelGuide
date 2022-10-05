//
//  Extensions.swift
//  TravelGuide
//
//  Created by amarenasoftware on 5.10.2022.
//

import Foundation
extension String {
    
    static func imageName()->String{
        let array = ["Image1", "Image2", "Image3"]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        return array[randomIndex]
    }
    
}
