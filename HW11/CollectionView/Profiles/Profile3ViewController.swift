//
//  Profile3ViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/11/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class Profile3ViewController: UIViewController {
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileSurnameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileNameLabel.text = ProfileManager.shared.name
        profileSurnameLabel.text = ProfileManager.shared.surname
    }
}
