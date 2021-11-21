//
//  ContentDisplayerViewData.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation

class ContentDisplayerViewData: GenericDataProtocol {
    
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var name: String
    private(set) var title: String
    private(set) var price: Double
    
    private(set) var isInfoViewHidden: Bool = false
    
    init(imageData: CustomImageViewComponentData,
         name: String,
         title: String,
         price: Double,
         isInfoViewHidden: Bool = false) {
        self.imageData = imageData
        self.name = name
        self.title = title
        self.price = price
        self.isInfoViewHidden = isInfoViewHidden
    }
    
}
