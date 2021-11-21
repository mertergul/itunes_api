//
//  MainDataFormatter.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation
import UIKit

class MainDataFormatter: MainDataFormatterProtocol {

    private var componentData: ResultArray?
    private var list: [SearchResult] = [SearchResult]()
    var paginationData: PaginationInfo = PaginationInfo()
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationData.limit <= paginationData.resultCount) ? count + 1 : count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: ResultArray) {
        
        
        self.componentData = response
        self.paginationData.resultCount = response.results.count
        self.list.append(contentsOf: response.results)
    }
    
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        
        return ContentDisplayerViewData(imageData: CustomImageViewComponentData(imageUrl:list[index].artworkUrl100 ),
                                        name: list[index].trackName,
                                        title: list[index].releaseDate,
                                        price: (list[index].trackPrice ?? list[index].price) ?? 0)
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].trackID
    }
    func reset() {
      paginationData.offset = 0
      list.removeAll()
    }

}

