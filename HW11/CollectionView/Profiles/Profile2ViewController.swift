//
//  Profile2ViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/11/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class Profile2ViewController: UIViewController {
       @IBOutlet weak var profileNameLabel: UILabel!
        @IBOutlet weak var profileSurnameLabel: UILabel!
    @IBOutlet weak var imageOfProfile2: UIImageView!
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
            super.viewDidLoad()
            profileNameLabel.text = ProfileManager.shared.name
            profileSurnameLabel.text = ProfileManager.shared.surname
            textLabel.text = "Height: \(ProfileManager.shared.height)\nWeight: \(ProfileManager.shared.weight)\nGender: \(ProfileManager.shared.gender)"
        }
}
