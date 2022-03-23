//
//  FriendPhotoViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 27.11.2021.
//

import UIKit
import RealmSwift
import Kingfisher
// - MARK: FriendPhotoViewController
class FriendPhotoViewController: UIViewController {


    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var photoFriend: UIImageView!
    var currentImage = 0
    var namePhotoFriend: String = ""
    var arrayPhoto: Results<RealmPhoto>?
    var realmPhoto = [RealmPhoto]()
    var interactiveAnimator: UIViewPropertyAnimator!
// - MARK: FriendPhoto - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFillData()
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        view.addGestureRecognizer(recognizer)
        guard let url = arrayPhoto?[currentImage].url else {return}
        guard let urlPhoto = URL(string: url) else {return}
        photoFriend.kf.setImage(with: urlPhoto)
       /* let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onPan(_:)))
        photoFriend.isUserInteractionEnabled = true
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        photoFriend.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onPan(_:)))
        photoFriend.isUserInteractionEnabled = true
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        photoFriend.addGestureRecognizer(swipeLeft)*/
        
    }
    
 @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
     
     guard let arrayPhoto = arrayPhoto else {return}
     switch recognizer.state {
     case .began:
         interactiveAnimator?.startAnimation()
         interactiveAnimator = UIViewPropertyAnimator(
            duration: 0.5,
            curve: .easeInOut,
            animations: {
                self.photoFriend.alpha = 0.5
                self.photoFriend.transform = .init(scaleX: 1.5, y: 1.5)
            })
         interactiveAnimator.pauseAnimation()
     case .changed:
         let translition = recognizer.translation(in: self.view)
         interactiveAnimator.fractionComplete = abs(translition.x / 100)
         self.photoFriend.transform = CGAffineTransform(translationX: translition.x, y: 0)
         
     case .ended:
         interactiveAnimator.stopAnimation(true)
         if recognizer.translation(in: self.view).x < 0 {
            

             if currentImage < arrayPhoto.count - 1  {
                 self.currentImage += 1
             }
         } else {
             if currentImage != 0 {
                 self.currentImage -= 1
             }
         }
         interactiveAnimator.addAnimations {
             self.photoFriend.transform = .identity
             self.photoFriend.alpha = 1
         }
         interactiveAnimator?.startAnimation()
         
     default: break

     

        
     
    
    /* if let swipeGesture = recognizer as? UISwipeGestureRecognizer {
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
             photoFriend.load(url: URL(string: arrayPhoto[currentImage].photo))
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
   */
 }
     guard let url = URL(string: arrayPhoto[currentImage].url) else {return}
     photoFriend.kf.setImage(with: url)

}
}
