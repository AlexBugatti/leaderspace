//
//  RocketView.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class RocketView: NibView {

    @IBOutlet weak var flameView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        flameView.animationImages = [UIImage(named: "0")!,
                                     UIImage(named: "1")!,
                                     UIImage(named: "2")!,
                                     UIImage(named: "3")!,
                                     UIImage(named: "4")!,
                                     UIImage(named: "5")!,
                                     UIImage(named: "6")!,
                                     UIImage(named: "7")!,
                                     UIImage(named: "8")!,
                                     UIImage(named: "9")!,
                                     UIImage(named: "10")!,
                                     UIImage(named: "11")!,
                                     UIImage(named: "12")!,
                                     UIImage(named: "13")!,
                                     UIImage(named: "14")!]
        flameView.animationRepeatCount = 0
        flameView.animationDuration = 1.5
        flameView.startAnimating()

    }
    
    func start() {
        flameView.startAnimating()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
