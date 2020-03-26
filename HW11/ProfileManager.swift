//
//  ProfileManager.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/21/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import UIKit

class ProfileManager {
    //singleton
    static let shared = ProfileManager()
        var login = ""
        var password = ""
        var name = ""
        var surname = ""

        var height = ""
        var weight = ""
        var hairColor = ""
        var skinColor = ""
        var eyeColor = ""
        var birthYear = ""
        var gender = ""

    private init() {
    }
}
