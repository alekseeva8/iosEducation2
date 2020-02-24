//
//  Validator.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/21/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import UIKit

class Validator {
    
    var login: String
    var password: String
    var loginIsCorrect = false
    var passwordIsCorrect = false
    
    init(login: String, password: String) {
            self.login = login
            self.password = password
        }
    
    
    func isLoginCorrect() -> Bool {
        if login.count > 0 {
            loginIsCorrect = true
        }
        else {
            loginIsCorrect = false
        }
        return loginIsCorrect
    }
    
    func isLoginContainsCorrectSymbols() -> Bool {
           var arrayOfActualSymbols: [Int] = []
           let rangeOfCorrectSymbols1 = 65...90
           let rangeOfCorrectSymbols2 = 48...57
           let rangeOfCorrectSymbols3 = 97...122
           for symbol in login.utf8 {
                   arrayOfActualSymbols.append(Int(symbol))
                   }
           var numberCorrect = 0
           for i in arrayOfActualSymbols {
           if rangeOfCorrectSymbols1.contains(i) || rangeOfCorrectSymbols2.contains(i) || rangeOfCorrectSymbols3.contains(i) {
                           numberCorrect += 1
                       }
                   }
           return numberCorrect == login.count
       }
    
    
    func isPasswordCorrect() -> Bool {
        if password.count >= 6 {
            passwordIsCorrect = true
        }
        else {
            passwordIsCorrect = false
        }
        return passwordIsCorrect
    }
    
    func alertSending(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Incorrect login or password", message: "Login must contain latin symbols and numbers. Password must contain more than 6 symbols", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
         alertController.addAction(cancelAction)
        (sender as AnyObject).present(alertController, animated: true, completion: nil)
    }
    
}
