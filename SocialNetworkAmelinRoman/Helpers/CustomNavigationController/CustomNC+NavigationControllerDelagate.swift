//
//  CustomNC+NavigationControllerDelagate.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 16.12.2021.
//

import UIKit


extension CustomNavigationController: UINavigationControllerDelegate {
    
    func configure() {
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactiveTransition.isStrartedAnimate ? interactiveTransition : nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return CustomPushAnimate()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return CustomPopAnimate()
        }
        return nil
    }
    
    
    
    
    
}
