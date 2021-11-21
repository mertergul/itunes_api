//
//  AppDelegate.swift
//  iTunes Search
//
//  Created by Mert Ergul on 25.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        let mainView = SplashViewBuilder.build {
//        splash finalize
            self.initializeMainView()
        }
        
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
        window?.backgroundColor = .black
        
        return true
    }
    private func initializeMainView() {
        DispatchQueue.main.async {
//            MainView transition animation
            UIView.transition(with: self.window!, duration: 3, options: .transitionCrossDissolve) {
                self.fireMainView()
            }
        }
    }
    
    private func fireMainView() {
        let mainView = MainViewBuilder.build()
        
        
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
    }


}

