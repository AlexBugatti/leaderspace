//
//  Action.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class Action {

    var userId: String
    var taskId: Int
    
    init?(from map: [String: Any]) {
        
        guard let userId = map["user_id"] as? String, let taskId = map["task_id"] as? Int else {
            return nil
        }
        
        self.userId = userId
        self.taskId = taskId
        
    }
    
}
