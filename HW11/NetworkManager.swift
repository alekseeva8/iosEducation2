//
//  NetworkManager.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/25/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class NetworkManager {
    //singleton
//    static let shared = NetworkManager()
//    private init() {
//       }

    var studentsNames: [String] = []

    struct SWPeople: Codable {
//        let count: Int
        let people: [SWPerson]

        enum CodingKeys: String, CodingKey {
//        case count
        case people = "results"
            }
    }

    struct SWPerson: Codable {
        let name: String
        let gender: String
    }

    func getData(completion: @escaping (NetworkManager.SWPeople) -> Void) {
        guard let url = URL(string: "https://swapi.co/api/people") else {return}
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {return}
            print(data)
            //сюда прописать обработку ошибок: вывод для пользователя информации по ошибке
             guard error == nil else {return}
//            if let error = error {
//                    print(error)
//                }
//            do {
            if let json = try? JSONDecoder().decode(SWPeople.self, from: data) {
                print(json)
                completion(json)
                json.people.forEach { (one) in
//                    print(one.name)
//                    print(one.gender)
                self.studentsNames.append(one.name)
                }
            }
//                } catch {
//                print(error)
//            }

            }
        task.resume()
    }
}
