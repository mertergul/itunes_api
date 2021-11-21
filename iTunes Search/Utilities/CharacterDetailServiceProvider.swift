//
//  CharacterDetailServiceProvider.swift
//  WeatherApplication
//
//  Created by Mert Ergul on 24.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import SwiftUI

class CharacterDetailServiceProvider: ApiServiceProvider<CharacterDetailRequest> {
    
    init(request: CharacterDetailRequest) {
        super.init(method: .get, baseUrl: BaseUrl.detailurl.rawValue,  data: request)
    }
    
}
