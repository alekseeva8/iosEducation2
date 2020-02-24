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
    @IBOutlet weak var profileSurnameLabel: UILabel!
    @IBOutlet weak var studDescriptionLabel: UILabel!
    
    var profileNameLabelInformation = ""
    var profileSurnameLabelInformation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileNameLabel.text = profileNameLabelInformation
        profileSurnameLabel.text = profileSurnameLabelInformation
        
    }
    

    

}
