//
//  LeaderbordCell.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class LeaderbordCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = 15
            self.containerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var pictureView: UIImageView! {
        didSet {
            self.pictureView.layer.cornerRadius = 8
            self.pictureView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.containerView.dropShadow(color: .lightGray, opacity: 0.5, offSet: CGSize.init(width: 3, height: 3), radius: 3, scale: true)
//        self.containerView.drop
    }

    func configure(_ item: Leaderboard) {
        self.titleLabel.text = item.title
    }
    
}
