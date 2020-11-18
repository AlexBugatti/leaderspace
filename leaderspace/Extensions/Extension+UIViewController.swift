//
//  Extension+UIViewController.swift
//  easy-school
//
//  Created by Александр on 07.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func xib(name: String? = nil) -> Self {
        return Self(nibName: name, bundle: nil)
    }
    
}
