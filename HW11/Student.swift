//
//  Student.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/2/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

struct Student {
    var name: String
    var surname: String
    var gender: Gender

    enum Gender {
    case male, female
}
    init(name: String, surname: String, gender: Gender) {
        self.name = name
        self.surname = surname
        self.gender = gender
    }
}
