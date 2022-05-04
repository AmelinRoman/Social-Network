//
//  LoginViewController.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 15.11.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let loginSegue = "loginButtom"
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.transition(with: titleLabel, duration: 3, options: .transitionFlipFromTop, animations: {[weak self] in
            self?.titleLabel.text = "Social Network"
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // - Делаем подписку на событие
        NotificationCenter.default.addObserver(self, selector: #selector(keyboarDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        recognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboarDidShow(_ notificatoin: Notification) {
        // - получаем размер клавитуры пользователя
        let kbSize = (notificatoin.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        guard let kbHeight = kbSize?.height else {return}
        // - делаем скролл вниз на размер клавиатуры
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbHeight + 100, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        // - убираем отступ при закрытие клавиатуры
        let contentInserts = UIEdgeInsets.zero
        scrollView.contentInset = contentInserts
        scrollView.scrollIndicatorInsets = contentInserts
        
    }
    // - Функция для убираем клавитуры при нажатие на любую точку экрана
    @objc func onTap(_ recognizer: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
        
    }
    
    deinit {
        // - Отписываемся от всех подписок
        NotificationCenter.default.removeObserver(self)
        
    }
    // - Функция вызова сообщение при неправильном вводе логина и пароля
    private func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Wrong login or password", preferredStyle: .alert)
        let alertItem = UIAlertAction(title: "Okey", style: .cancel)
        
    { [weak self] _ in
        guard let self = self else {return}
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        alertController.addAction(alertItem)
        present(alertController, animated: true, completion: nil)
        
        let loginPlaceholderText = "username is not correct"
        let passwordPlaceholderText = "password is not correct"
        
        loginTextField.placeholder = loginPlaceholderText
        passwordTextField.placeholder = passwordPlaceholderText
    }
    // - Функция проверки логина и пароля
    private func isValid() -> Bool {
        
        if loginTextField.text == "1",
           passwordTextField.text == "1" {
            return true
        } else {
            return false
        }
    }
    // - Фунция нажатия на кнопку
    @IBAction func buttomPresed(_ sender: Any) {
      // - делаем значение не опциональным 
        if isValid() {
            
            performSegue(withIdentifier: loginSegue, sender: nil)
            
        } else {
            
            showAlert()
            
        }
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
