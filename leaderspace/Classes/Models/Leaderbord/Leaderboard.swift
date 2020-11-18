//
//  Leaderboard.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

struct Leaderboard {
    
    var title: String
    var id: Int
     
    var dictionary: [String: Any] {
        return [
            "title": title,
            "id": id
        ]
    }
    
}

extension Leaderboard {
    init?(dictionary: [String : Any]) {
        guard   let title = dictionary["title"] as? String, let id = dictionary["id"] as? Int
            else { return nil }
         
        self.title = title
        self.id = id
    }
}

