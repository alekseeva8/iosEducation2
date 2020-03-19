//
//  StudentCollectionViewCell.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
     static let reuseID = "StudentCollectionViewCell"
    //создание properties ячейки
    let studentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    let surnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(studentImageView)
        addSubview(nameLabel)
        addSubview(surnameLabel)
        studentImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        studentImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        studentImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        //studentImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        studentImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        studentImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        nameLabel.topAnchor.constraint(equalTo: studentImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        surnameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
