//
//  Storage.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class Storage: NSObject {

    static let shared = Storage()
    
    var users: [User] = []
    var actions: [Action] = []
    var leaderboards: [Leaderboard] = []
    var tasks: [Task] = []
    
    override init() {
        super.init()
        self.loadResources()
    }
    
    func loadResources() {
        FirebaseAPI.getActions { (actions) in
            self.actions = actions
        }
        FirebaseAPI.getLeaderboards { (leaderboards) in
            self.leaderboards = leaderboards
        }
        FirebaseAPI.getUsers { (users) in
            self.users = users
        }
        FirebaseAPI.getTasks { (tasks) in
            self.tasks = tasks
        }
    }
}
