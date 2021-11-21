//
//  MainViewBuilder.swift
//  iTunes Search
//
//  Created by Mert Ergul on 25.10.2021.
//

import Foundation
import UIKit

class MainViewBuilder {
    class func build() -> UIViewController {
        let mainViewDataFormatter = MainDataFormatter()
        let viewModel = MainViewModel(dataFormatter: mainViewDataFormatter)
        let viewController = MainViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.navigationBar.barTintColor = UIColor.white
        
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        viewController.navigationController?.navigationBar.standardAppearance = appearance;
        return navigationViewController
    }
}
