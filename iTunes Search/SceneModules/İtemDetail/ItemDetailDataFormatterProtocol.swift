//
//  ItemDetailDataFormatterProtocol.swift
//  iTunes Search
//
//  Created by Mert Ergul on 21.11.2021.
//

import Foundation

protocol ItemDetailDataFormatterProtocol {
    
    func convertItemDetailView(from rawData: SearchResult) -> ItemDetailViewData
    
}
