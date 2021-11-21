//
//  EndpointHelper.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrls
//typealias Paths = EndpointHelper.Paths

enum EndpointHelper {

    enum BaseUrls: String {
        case dev = "https://itunes.apple.com/search?"
    }

    enum Paths: GenericValueProtocol {

        typealias Value = String

        var value: String {
            switch self {
            case .characters:
                return "characters"
            case .detail(let characterId):
                return "characters/\(characterId)"
            }
        }

        case characters
        case detail(Int)
    }
    
}
