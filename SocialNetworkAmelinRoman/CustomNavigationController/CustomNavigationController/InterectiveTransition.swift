//
//  interectiveTransition.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 16.12.2021.
//

import UIKit

class InterectiveTransition: UIPercentDrivenInteractiveTransition {
    
    var viewController: UIViewController? {
        didSet{
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(onPan(_:)))
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
            
        }
    }
    
    
    var isStrartedAnimate = false
    var shouldFinish = false
    
    @objc func onPan(_ gesture: UIScreenEdgePanGestureRecognizer) {
        switch gesture.state {
        case .began:
            self.isStrartedAnimate = true
            self.viewController?.navigationController?.popViewController(animated: true)
            //self.pause()
        case .changed:
            let translation = gesture.translation(in: gesture.view)
            //if translation.x < 0 {translation.x = -translation.x}
            let relativTransition = translation.x / (gesture.view?.frame.width ?? 1)
            let progress = max(0, min(1, relativTransition))
            self.shouldFinish = progress > 0.3
            //if progress > 0.3 {self.shouldFinish = true}
            self.update(progress)
        case .ended:
            self.isStrartedAnimate = false
            //self.shouldFinish ? self.finish() : self.cancel()
            if shouldFinish {
                self.finish()
            }
            else {self.cancel()}
        case .cancelled:
            self.isStrartedAnimate = false
            self.cancel()
        default: return
        }
        
    }

}
