//
//  CustomSegue.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 18.12.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        
        guard let containerView = source.view.superview else {return}
        
        let containerViewFrame = containerView.frame
        let sourceViewTargetFrame = CGRect(x: -containerViewFrame.width,
                                           y: 0,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        
        let destinationViewTargetFrame = source.view.frame
        
        containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: containerViewFrame.width,
                                        y: 0,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        
        UIView.animate(withDuration: 1,
                       animations: {[weak self] in
            guard let self = self else {return}
            
            self.source.view.frame = sourceViewTargetFrame
            self.destination.view.frame = destinationViewTargetFrame
            
        },
                       completion: {[weak self] finished in
            guard let self = self else {return}
            self.source.present(self.destination,
                                 animated: true,
                                 completion: nil)
            
        })
        
    }

}
