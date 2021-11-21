//
//  ApiManagerBuilder.swift
//  iTunes Search
//
//  Created by Mert Ergul on 1.11.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ApiManagerBuilder {
    

    private static let manager = APIManager()
    
    class func build() -> APIManagerInterface {
        return manager
    }
    
}
