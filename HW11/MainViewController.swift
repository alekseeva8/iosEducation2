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
    @IBOutlet weak var webinarImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileButton.layer.cornerRadius = 5
        classButton.layer.cornerRadius = 5
        welcomeLabel.text = "Welcome, \(ProfileManager.shared.login)!"

        //добавление распознования жеста на helloLabel
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.handleTapGesture(sender:)))
//        webinarImage.addGestureRecognizer(tapGesture)
//        webinarImage.isUserInteractionEnabled = true
    }

//    @objc func handleTapGesture(sender: UIPinchGestureRecognizer) {
//        webinarImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//    }

    @IBAction func handleTapGesture(_ sender: Any) {
        webinarImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }

    @IBAction func classButtonTapped(_ sender: UIButton) {
    }
    //unwind segue от экранов Profile и Students к Main экрану
  @IBAction func unwindToMain(unwindSegue: UIStoryboardSegue) {}

}
