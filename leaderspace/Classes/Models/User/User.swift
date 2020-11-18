//
//  User.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

struct User {
    
    var name: String
    var identifier: String
    var imageURL: String?
     
    var dictionary: [String: Any] {
        return [
            "name": name
        ]
    }
    
    var value: Int = 0
    
    mutating func set(val: Int) {
        self.value = self.value + val
    }
    
    static var current: User? {
        get {
            if let dict = UserDefaults.standard.object(forKey: "user") as? [String: Any] {
                let user = User(from: dict)
                return user
            }
            
            return nil
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "user")
            UserDefaults.standard.synchronize()
        }
    }
    
}
 
extension User {
    init?(from map: [String : Any]) {
        
        guard  let name = map["name"] as? String,
               let identifier = map["identifier"] as? String
            else { return nil }
         
        self.name = name
        self.identifier = identifier
    }
}
