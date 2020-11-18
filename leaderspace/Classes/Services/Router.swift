//
//  Router.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

protocol Router {
    var navigationController: UINavigationController { get set }
}

class MainRouter: Router {
    var navigationController: UINavigationController {
        didSet {
            
        }
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let auth = AuthController.xib()
        auth.didAuthorize = {
            self.showProfile()
        }
        navigationController.pushViewController(auth, animated: false)
    }
    
    func showProfile() {
        let profileVC = ProfileController.xib()
        profileVC.didLeaderboard = { boards in
            self.showLeaderboards(boards)
        }
        self.navigationController.pushViewController(profileVC, animated: true)
    }
    
    func showSpace(board: Leaderboard) {
        let space = SpaceController(board: board)
        self.navigationController.pushViewController(space, animated: true)
    }
    
    func showLeaderboards(_ boards: [Leaderboard]) {
        let vc = LeaderController(boards: boards)
        vc.didSelect = { board in
            self.showSpace(board: board)
        }
        self.navigationController.pushViewController(vc, animated: true)
    }
}

