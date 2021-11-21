//
//  SplashViewController.swift
//  iTunes Search
//
//  Created by Mert Ergul on 25.10.2021.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController<SplashViewModel> {
//    splash view compenent
    
    private lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.image = PageViewImages.defaultSplashBackground.value
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    private lazy var titleInfo: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Search Application"
        temp.font = UIFont.systemFont(ofSize: 34 ,weight: UIFont.Weight.bold)
        temp.textColor = .white
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        appendComponents()
        viewModel.fireApplicationInitiateProcess()
    }
    
    private func appendComponents() {
        view.addSubview(image)
        view.addSubview(titleInfo)
        
        NSLayoutConstraint.activate([
        
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
            
            
        ])
    }
    
}
