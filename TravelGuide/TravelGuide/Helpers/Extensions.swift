//
//  Extensions.swift
//  TravelGuide


import Foundation
extension String {
    
    static func imageName()->String{
        let array = ["Image1", "Image2", "Image3"]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        return array[randomIndex]
    }
    
}
