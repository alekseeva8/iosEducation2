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
    var name: String
    var surname: String
    var gender: Gender
    var image: UIImage

    enum Gender {
    case male, female, none
}
    init(name: String, surname: String, gender: Gender, image: UIImage) {
        self.name = name
        self.surname = surname
        self.gender = gender
        self.image = image
    }
}
