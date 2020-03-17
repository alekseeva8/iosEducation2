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
    //var button = UIButton(frame: CGRect(x: 100, y: 100, width: 130, height: 35))
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    //var trailing: NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageOfProfile.layer.borderWidth = 1
        imageOfProfile.layer.borderColor = UIColor.black.cgColor
        profileNameLabel.text = ProfileManager.shared.name
        profileSurnameLabel.text = ProfileManager.shared.surname
        //кнопка
        button.backgroundColor = .yellow
        //self.view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 130).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        trailing = view.trailingAnchor.constraint(equalTo: button.trailingAnchor)
//        trailing?.isActive = true
//        trailing?.constant = 8
//        let top = button.topAnchor.constraint(equalTo: view.topAnchor)
//        top.isActive = true
//        top.constant = 20
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateToCircle()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.tag += 1
        if sender.tag > 3 {sender.tag = 0}
        switch sender.tag {
        case 1: animateButton()
        case 2: animateButton2()
        case 3: animateButton3()
        default: print("123")
        }
    }
    //преобразование картинки в круглую
    func animateToCircle() {
        UIImageView.animate(withDuration: 2) { [weak self] in
            guard let self = self else {return}
            guard let view = self.imageOfProfile else {return}
            view.layer.cornerRadius = view.bounds.width/2
        }
        }
    //функция: прямоугольная кнопка -> квадратная кнопка + граница
    func animateButton() {
        UIButton.animate(withDuration: 4) { [weak self] in
            guard let self = self else {return}
            guard let button = self.button else {return}
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            //button.widthAnchor.constraint(equalToConstant: 130).isActive = false
            //button.widthAnchor.constraint(equalToConstant: 35).isActive = true
            self.widthConstraint.constant = 35
        }
    }
    //функция: квадратная кнопка -> круглая кнопка + цвет меняетяся
        func animateButton2() {
        UIButton.animate(withDuration: 2) { [weak self] in
            guard let self = self else {return}
            guard let button = self.button else {return}
            button.layer.cornerRadius = self.button.bounds.width/2
            button.backgroundColor = .green
            }
        }
    //функция: кнопка улетает за экран
    func animateButton3() {
        //вар1 - использование constraints
//        trailing?.constant = -100
//        UIView.animate(withDuration: 2, animations: {self.view.layoutIfNeeded()})
        //вар2 - использование transform property
        UIView.animate(withDuration: 2) { [weak self] in
            guard let self = self else {return}
            let translateTransform = CGAffineTransform(translationX: 200, y: 0)
            self.button.transform = translateTransform
            
        }
    }
    }
