//
//  CharacterDataRequest.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation


public class CharacterDataRequest: Codable {
    
    private(set) public var limit: Int = 20
    private(set) public var offset: Int = 0
    private(set) public var term: String
    private(set) public var media: String
    
    public init(
                limit: Int = 20,offset: Int = 0,
                term: String, media: String
    ) {
        self.limit = limit
        self.offset = offset
        self.term = term
        self.media = media
    }
    
}
