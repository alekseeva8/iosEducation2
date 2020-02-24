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
        let validatorChild = Validator(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        
        if Validator.isLoginCorrect(validatorChild)() == true && Validator.isLoginContainsCorrectSymbols(validatorChild)() == true && Validator.isPasswordCorrect(validatorChild)() == true {

             performSegue(withIdentifier: "fromSignToMain", sender: nil)
        }
        else {
            validatorChild.alertSending(self)
        }
        
    }
    
    //передача значения, введенного в loginTextField, в label другого viewcontrollerа
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainVC = segue.destination as? MainViewController {
            let infToMainVC = loginTextField.text ?? ""
            mainVC.loginInformation = "Welcome, \(infToMainVC)!"
        }
        
    }
}
