//
//  HomeViewController.swift
//  OnBoarding
//
//  Created by Pritam Hinger on 07/10/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
        navigationItem.title = "Welcome, User"
    }
    
    @objc func handleSignOut(){
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }
}
