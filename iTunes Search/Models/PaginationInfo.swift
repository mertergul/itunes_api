//
//  PaginationInfo.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation

struct PaginationInfo {
    var resultCount: Int = 0
    var limit: Int = 20
    var offset: Int = 0
    var fetching: Bool = false
    var term: String = ""
    var media: String = ""
    
    
    func checkLoadingMore() -> Bool {
        return limit <= resultCount && !fetching
    }
    
    mutating func nextOffset() {
        fetching = true
        offset += limit
    }
    mutating func newTerm(with Value:String) {
        term = Value
    }
    mutating func newScope(with scopeIndex:Int) {
        
        switch scopeIndex {
        case 0:
            media = "movie"
        case 1:
            media = "music"
        case 2:
            media = "software"
        case 3:
            media = "ebook"
        default:
            media = "movie"
        }
    }
}
