//
//  ApiServiceProvider.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterListServiceProvider: ApiServiceProvider<CharacterDataRequest> {
    
    init(request: CharacterDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.dev.rawValue,
                   data: request)
    }
    
}
