//
//  CustomNavigationController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 16.12.2021.
//

import UIKit

class CustomNavigationController: UINavigationController {

    let interactiveTransition = InterectiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

}
