//
//  MainViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var classButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(ProfileManager.shared.login)!"
    }
    //unwind segue от экранов Profile и Students к Main экрану
  @IBAction func unwindToMain(unwindSegue: UIStoryboardSegue) {}

}
