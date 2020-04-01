//
//  SWPeople.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/26/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

//protocol MyProtocol{
//}

struct SWPeople: Codable {
    let count: Int
    let people: [SWPerson]

    enum CodingKeys: String, CodingKey {
    case count
    case people = "results"
    }
}
struct SWPerson: Codable {
    let name, height, mass, gender, hairColor, skinColor, eyeColor, birthYear: String
    //let vehicles: String
    //let starships: String

    enum CodingKeys: String, CodingKey {
    case name
    case height
    case mass
    case gender
    case hairColor = "hair_color"
    case skinColor = "skin_color"
    case eyeColor = "eye_color"
    case birthYear = "birth_year"
    //case vehicles
    //case starships
    }
}

//struct Starhip {
//}

