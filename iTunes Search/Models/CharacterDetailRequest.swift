//
//  CharacterDetailRequest.swift
//  WeatherApplication
//
//  Created by Mert Ergul on 24.10.2021.
//

import Foundation

class CharacterDetailRequest: Codable {
    
    private(set) public var id: Int?
   

    public init(id: Int? = nil
              ) {
        
        self.id = id
        
    }
    
}
