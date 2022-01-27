//
//  Animation.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 16.12.2021.
//

import UIKit

 final class CustomPushAnimate: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let sourse = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else {return}
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = sourse.view.frame
        
        destination.view.transform = CGAffineTransform(translationX: sourse.view.frame.width, y: 0)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.75,
                               animations: {
                let translition = CGAffineTransform(translationX: -200, y: 0)
                let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                sourse.view.transform = translition.concatenating(scale)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.2,
                               relativeDuration: 0.4,
                               animations: {
                let translition = CGAffineTransform(translationX: sourse.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                destination.view.transform = translition.concatenating(scale)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6,
                               relativeDuration: 0.4,
                               animations: {
                destination.view.transform = .identity
            })
        }, completion:{ isSuccefully in
            if isSuccefully && !transitionContext.transitionWasCancelled {
                sourse.view.transform = .identity
            }
            transitionContext.completeTransition(isSuccefully && !transitionContext.transitionWasCancelled)
            
        })
    }       
}
