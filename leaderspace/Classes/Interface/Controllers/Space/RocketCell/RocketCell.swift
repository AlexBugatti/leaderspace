//
//  RocketCell.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class RocketCell: UICollectionViewCell {

    @IBOutlet weak var rocketView: RocketView!
    @IBOutlet weak var constraintY: NSLayoutConstraint!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func start() {
        self.rocketView.start()
    }
    
    func confugure(user: User, maxValue: Int) {
        let pos = CGFloat(user.value) / CGFloat(maxValue)
        
        var const = self.frame.height - 40
        let height = self.frame.height * pos
        const = const - height
        self.constraintY.constant = const
        self.layoutIfNeeded()
        self.start()
        
        self.usernameLabel.text = user.name
        self.scoreLabel.text = "\(user.value) баллов"
    }

}
