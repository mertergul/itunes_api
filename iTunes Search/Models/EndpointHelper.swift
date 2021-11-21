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
        case detailurl =  "https://itunes.apple.com/lookup?"
    }
}
