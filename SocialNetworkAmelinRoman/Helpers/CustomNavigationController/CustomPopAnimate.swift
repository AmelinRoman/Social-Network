//
//  CustomPopAnimate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 18.12.2021.
//

import UIKit

class CustomPopAnimate: NSObject, UIViewControllerAnimatedTransitioning  {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else {return}
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.frame = source.view.frame
        
        let translation = CGAffineTransform(translationX: -200, y: 0)
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        destination.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.4,
                               animations: {
                let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                
                source.view.transform = translation.concatenating(scale)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4,
                               relativeDuration: 0.4,
                               animations: {
                
                source.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.75,
                               animations: {
                
                destination.view.transform = .identity
            })
        },
                                completion: { isSuccefully in
            if isSuccefully && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            }
            else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(isSuccefully && !transitionContext.transitionWasCancelled)
        })
        
    }
    
    
    
}
