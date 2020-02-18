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
        
        let textOfLogIn = loginTextField.text ?? ""
        let numbOfSymbolsInLogIn = textOfLogIn.count
        let textOfPassword = passwordTextField.text ?? ""
        let numbOfSymbolsInPassword = textOfPassword.count
        
        if numbOfSymbolsInLogIn > 0 && numbOfSymbolsInPassword >= 6 {
                performSegue(withIdentifier: "fromSignToMain", sender: nil)
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