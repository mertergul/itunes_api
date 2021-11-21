//
//  SplashViewBuilder.swift
//  iTunes Search
//
//  Created by Mert Ergul on 25.10.2021.
//

import UIKit

class SplashViewBuilder {
    
    class func build(with completion: @escaping VoidBlock) -> UIViewController {
        let viewModel = SplashViewModel(completion: completion)
        return SplashViewController(viewModel: viewModel)
    }
    
}
