//
//  LoadingScreenViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 07.12.2021.
//

import UIKit

class LoadingScreenViewController: UIViewController {

    @IBOutlet weak var oneView: UIView!
    @IBOutlet weak var twoView: UIView!
    @IBOutlet weak var threeView: UIView!
    
    let loadToLoginSegue = "loadToLoginSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        dotsAnimateKeyFrame(exitAfter: 3, currentCount: 0)
    }
    
    func dotsAnimateKeyFrame(exitAfter: Int, currentCount: Int) {
        let animateDuration: CGFloat = 3
        
        UIView.animateKeyframes(withDuration: animateDuration,
                                delay: 0,
                                options: [],
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.333333,
                               animations: {[weak self] in
                self?.oneView.alpha = 0
                self?.twoView.alpha = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.333333,
                               relativeDuration: 0.333333,
                               animations: {[weak self] in
                self?.twoView.alpha = 0
                self?.threeView.alpha = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.666666,
                               relativeDuration: 0.333333,
                               animations: {[weak self] in
                self?.threeView.alpha = 0
                self?.oneView.alpha = 1
            })
        }, completion: {[weak self] _ in
            guard let self = self else {return}
            if currentCount < exitAfter {
                self.dotsAnimateKeyFrame(exitAfter: exitAfter, currentCount: currentCount + 1)
            }
            else {
                self.oneView.alpha = 0
                self.performSegue(withIdentifier: self.loadToLoginSegue, sender: nil)
            }
        })
    }
    
    func configureView() {
        let cornerRadius: CGFloat = 20

        oneView.layer.cornerRadius = cornerRadius
        twoView.layer.cornerRadius = cornerRadius
        twoView.alpha = 0
        threeView.layer.cornerRadius = cornerRadius
        threeView.alpha = 0
        
    }
    

}
