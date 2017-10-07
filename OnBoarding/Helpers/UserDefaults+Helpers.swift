//
//  UserDefaults+Helpers.swift
//  OnBoarding
//
//  Created by Pritam Hinger on 07/10/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
