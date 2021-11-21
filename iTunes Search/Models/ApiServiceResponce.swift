//
//  ApiServiceResponce.swift
//  iTunes Search
//
//  Created by Mert Ergul on 30.10.2021.
//


import Foundation
import SwiftUI

public struct ResultArray: Codable {
  var resultCount = 0
  var results = [SearchResult]()
}

public struct SearchResult: Codable {
    var trackID: Int
    var  trackName: String
    var artworkUrl100: String
    var trackPrice: Double?
    var price : Double?
    var releaseDate: String
    var longDescription: String?
    var description: String?
    

    enum CodingKeys: String, CodingKey {
       
        case trackID = "trackId"
        case trackName
        case artworkUrl100
        case releaseDate
        case trackPrice
        case price
        case longDescription
        case description
            
        
    }
}


