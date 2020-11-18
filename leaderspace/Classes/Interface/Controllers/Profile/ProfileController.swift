//
//  ProfileController.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    var didLeaderboard: (([Leaderboard])->())?
    
    private var leaderboards: [Leaderboard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.leaderboards = Storage.shared.leaderboards
        // Do any additional setup after loading the view.
    }
    
//    func getLeaderboards() {
//        FirebaseAPI.getLeaderboards { (leaderboards) in
//            self.leaderboards = leaderboards
//        }
//    }

    @IBAction func onDidLeaderBoardTapped(_ sender: Any) {
        self.didLeaderboard?(self.leaderboards)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
