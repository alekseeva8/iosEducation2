//
//  SignInViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        //условия для перехода к другому экрану (при нажатии на кнопку)
        
         //инициализация singleton, передача в него значения loginTF, passwordTF
        ProfileManager.shared.login = loginTextField.text ?? ""
        ProfileManager.shared.password = passwordTextField.text ?? ""
        
        let validator = Validator()
        if validator.isLoginCorrect(login: ProfileManager.shared.login) == true && validator.isLoginContainsCorrectSymbols(login: ProfileManager.shared.login) == true && validator.isPasswordCorrect(password: ProfileManager.shared.password) == true {
            
             signButton.backgroundColor = UIColor.favoriteColor
             performSegue(withIdentifier: "fromSignToMain", sender: nil)
            
        }
        else {
            validator.alertSending(self)
        }
    }
    
    //передача значения, введенного в loginTextField, в label другого viewcontrollerа
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let mainVC = segue.destination as? MainViewController {
//            //let infToMainVC = loginTextField.text ?? ""
//            mainVC.loginInformation = "Welcome, \(ProfileManager.shared.login)!"
//        }
        
//    }
}
    //добавление property с моим любимым цветом
    extension UIColor {
    static var favoriteColor: UIColor {
        return UIColor(red: 0.1, green: 0.8, blue: 0.1, alpha: 1.0)
    }
}


