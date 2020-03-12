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
    static let shared = ProfileManager()
        var login: String = ""
        var password: String = ""
        var name = ""
        var surname = ""
    private init() {
    }
}
