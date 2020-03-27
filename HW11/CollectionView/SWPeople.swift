//
//  SWPeople.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/26/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

struct SWPeople: Codable {
    let count: Int
    let people: [SWPerson]

    enum CodingKeys: String, CodingKey {
    case count
    case people = "results"
    }
}
struct SWPerson: Codable {
    let name: String
    let height: String
    let mass: String
    let gender: String
    let hairColor: String

    enum CodingKeys: String, CodingKey {
    case name
    case height
    case mass
    case gender
    case hairColor = "hair_color"
    }
}
