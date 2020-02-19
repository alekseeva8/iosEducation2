//
//  ProfileViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var studDescriptionLabel: UILabel!
    
    var profileNameLabelInformation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileNameLabel.text = profileNameLabelInformation
    }
    

    

}
