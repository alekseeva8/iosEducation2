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
    @IBOutlet weak var imageOfProfile: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageOfProfile.layer.borderWidth = 1
        imageOfProfile.layer.borderColor = UIColor.black.cgColor
        profileNameLabel.text = ProfileManager.shared.name
        profileSurnameLabel.text = ProfileManager.shared.surname
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateToCircle()
    }
    func animateToCircle() {
//        UIImageView.animate(withDuration: 2) { [weak self] in
//            guard let self = self else {return}
//            guard let view = self.imageOfProfile else {return}
//            view.layer.cornerRadius = view.bounds.width/2
        UIImageView.animate(withDuration: 2) {
            guard let imageView = self.imageOfProfile else {return}
            imageView.layer.cornerRadius = imageView.bounds.width/2
        }
        }
    }
