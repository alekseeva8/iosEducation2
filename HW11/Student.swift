//
//  Student.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/2/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import UIKit

struct Student {
    var height, mass, hairColor, skinColor, eyeColor, birthYear: String
    var name: String
    var surname: String
    var gender: String
    var image: UIImage

//    enum Gender {
//    case male, female, none
//}
    init(name: String, surname: String, gender: String, image: UIImage, height: String, mass: String, hairColor: String, skinColor: String, eyeColor: String, birthYear: String) {
        self.name = name
        self.surname = surname
        self.gender = gender
        self.image = image
        self.height = height
        self.mass = mass
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
    }
}
