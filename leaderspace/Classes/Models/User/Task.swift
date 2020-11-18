//
//  Task.swift
//  leaderspace
//
//  Created by Александр on 14.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class Task {

    var description: String
    var id: Int
    var leaderspaceId: Int
    var title: String
    var type: String
    var value: Int
    
    init?(from map: [String: Any]) {
        guard let description = map["description"] as? String,
              let id = map["id"] as? Int,
              let leaderspaceId = map["leaderspace_id"] as? Int,
              let title = map["title"] as? String,
              let type = map["type"] as? String,
              let value = map["value"] as? Int else {
                return nil
        }
        
        self.description = description
        self.id = id
        self.leaderspaceId = leaderspaceId
        self.title = title
        self.type = type
        self.value = value
    }
    
}
