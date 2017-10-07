//
//  MainNavigationViewController.swift
//  OnBoarding
//
//  Created by Pritam Hinger on 07/10/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn(){
            print("User is logged in")
            let homeController = HomeController()
            viewControllers = [homeController]
        }
        else{
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }

    @objc func showLoginController() {
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: {
            
        })
    }
    
    // MARK: - Fileprivate Methods
    func isLoggedIn() -> Bool {
        return false
    }
}


class HomeController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        navigationItem.title = "Welcome, User"
        
    }
}
