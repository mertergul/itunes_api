//
//  PageViewImages.swift
//  iTunes Search
//
//  Created by Mert Ergul on 25.10.2021.
//

import UIKit

enum PageViewImages: String, GenericValueProtocol {

    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case defaultSplashBackground = "defaultSplashBackground"
    
}

