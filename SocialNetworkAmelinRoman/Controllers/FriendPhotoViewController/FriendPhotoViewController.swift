//
//  FriendPhotoViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 27.11.2021.
//

import UIKit
// - MARK: Класс вывода фотографии на отдельный экран
class FriendPhotoViewController: UIViewController {


    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var photoFriend: UIImageView!
    
    //private var pageView = UIPageControl()
    //private var interactiveAnimator: UIViewPropertyAnimator!
    private var backPhotoFriend = UIImageView()
    var currentImage = 0
    private var leftSwipe: Bool = false
    private var rightSwipe: Bool = false
    var namePhotoFriend: String = ""
    var arrayPhoto = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFillData()
        /*let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.view.addGestureRecognizer(recognizer)*/
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onPan(_:)))
        photoFriend.isUserInteractionEnabled = true
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        photoFriend.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onPan(_:)))
        photoFriend.isUserInteractionEnabled = true
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        photoFriend.addGestureRecognizer(swipeLeft)
        // Do any additional setup after loading the view.
    }
    
    /*private func leftSwipe(isLeft: Bool) {
        
        self.photoFriend.transform = .identity
        self.backPhotoFriend.transform = .identity
        self.photoFriend.image = UIImage(named: arrayPhoto[currentImage])
        
        if isLeft {
            
            self.backPhotoFriend.image = UIImage(named: arrayPhoto[currentImage + 1])
            self.backPhotoFriend.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        }
        else {
            
            self.backPhotoFriend.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
            self.backPhotoFriend.image = UIImage(named: arrayPhoto[currentImage - 1])
        }
    }
    
    private func onLeftSwipe(isLeft: Bool) {
        
        self.photoFriend.transform = .identity
        self.backPhotoFriend.transform = .identity
        
        if isLeft {
            self.currentImage += 1
        }
        else {
            self.currentImage -= 1
        }
        self.photoFriend.image = UIImage(named: self.arrayPhoto[self.currentImage])
        self.photoFriend.bringSubviewToFront(self.photoFriend)
        self.pageView.currentPage = self.currentImage
    }*/
    
    
    
 @objc func onPan(_ recognizer: UIGestureRecognizer) {
        
     
     /*if let animator = interactiveAnimator,
     animator.isRunning {
         return
     }
     
     switch recognizer.state {
     case .began:
         self.photoFriend.transform = .identity
         self.photoFriend.image = UIImage(named: arrayPhoto[currentImage])
         self.backPhotoFriend.transform = .identity
         self.photoFriend.bringSubviewToFront(photoFriend)
         
         interactiveAnimator.startAnimation()
         interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                      curve: .easeInOut,
                                                      animations: { [weak self] in
             self?.photoFriend.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
         })
         interactiveAnimator.pauseAnimation()
         leftSwipe = false
         rightSwipe = false
     case .changed:
         var translation = recognizer.translation(in: self.view)
         
         if translation.x < 0 && (!leftSwipe) {
             if self.currentImage == (arrayPhoto.count - 1) {
                 interactiveAnimator.stopAnimation(true)
                 return
             }
             leftSwipe(isLeft: true)
             
             interactiveAnimator.stopAnimation(true)
             interactiveAnimator.addAnimations { [weak self] in
                 self?.photoFriend.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                 self?.backPhotoFriend.transform = .identity
             }
             interactiveAnimator.addCompletion({ [weak self] _ in
                 self?.onLeftSwipe(isLeft: true)
             })
             
             interactiveAnimator.startAnimation()
             interactiveAnimator.pauseAnimation()
             leftSwipe = true
         }
         
         if translation.x > 0 && (!rightSwipe) {
             if self.currentImage == 0 {
                 interactiveAnimator.stopAnimation(true)
                 return
             }
             leftSwipe(isLeft: false)
             interactiveAnimator.stopAnimation(true)
             interactiveAnimator.addAnimations { [weak self] in
                 self?.photoFriend.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                 self?.backPhotoFriend.transform = .identity
             }
             interactiveAnimator.addCompletion({ [weak self] _ in
                 self?.onLeftSwipe(isLeft: false)
             })
             interactiveAnimator.startAnimation()
             interactiveAnimator.pauseAnimation()
             rightSwipe = true
         }
         
         if rightSwipe && (translation.x < 0) {return}
         if leftSwipe && (translation.x > 0) {return}
         
         if translation.x < 0 {
             translation.x = -translation.x
         }
         interactiveAnimator.fractionComplete = translation.x / (UIScreen.main.bounds.width)
         
     case .ended:
         if let animator = interactiveAnimator,
         animator.isRunning {
             return
         }
         var translation = recognizer.translation(in: self.view)
         
         if translation.x < 0 {translation.x = -translation.x}
         if (translation.x / (UIScreen.main.bounds.width)) > 0.5 {
             interactiveAnimator.startAnimation()
         }
         else {
             interactiveAnimator.stopAnimation(true)
             interactiveAnimator.finishAnimation(at: .start)
             interactiveAnimator.addAnimations { [weak self] in
                 guard let self = self else {return}
                 self.photoFriend.transform = .identity
                 if self.leftSwipe {
                     self.backPhotoFriend.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                 }
                 if self.rightSwipe {
                     self.backPhotoFriend.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                 }
             }
             interactiveAnimator.addCompletion({ [weak self] _ in
                 self?.photoFriend.transform = .identity
                 self?.backPhotoFriend.transform = .identity
             })
             
             interactiveAnimator.startAnimation()
         }
         
     default: return
     }*/
     if let swipeGesture = recognizer as? UISwipeGestureRecognizer {
         // let translation = recognizer.translation(recognizer.view)
         switch swipeGesture.direction {
         case UISwipeGestureRecognizer.Direction.left:
             
             photoFriend.transform = .identity
             backPhotoFriend.transform = .identity
             if currentImage == arrayPhoto.count - 1 {
                 currentImage = 0
             }
             else {
                 currentImage += 1
                 
             }
             photoFriend.image = UIImage(named: arrayPhoto[currentImage])
             backPhotoFriend.image = UIImage(named: arrayPhoto[currentImage])
             
             
          
                
         case UISwipeGestureRecognizer.Direction.right:
             
             if currentImage == 0 {
                 currentImage = arrayPhoto.count - 1
             }
             else {
                 UIView.animate(withDuration: 2, animations: { [weak self] in
                     guard let self = self else {return}
                     self.photoFriend.transform = CGAffineTransform(translationX: self.photoFriend.frame.width, y: 0)
                     self.currentImage -= 1
                     self.photoFriend.transform = .identity
                     self.photoFriend.image = UIImage(named: self.arrayPhoto[self.currentImage])
                 })
                 
             }
             photoFriend.image = UIImage(named: arrayPhoto[currentImage])
             backPhotoFriend.image = UIImage(named: arrayPhoto[currentImage])
         default: break
         }
     }
     
 }
    

}
