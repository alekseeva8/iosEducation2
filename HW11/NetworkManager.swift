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

    func getData(completion: @escaping (SWPeople?, Error?) -> Void) {
        guard let url = URL(string: "https://swapi.co/api/people") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //let task = URLSession.shared.dataTask(with: request)

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            //выполняем на основном потоке, в приоритете
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(nil, error)
                    return
                }
                guard let data = data else {return}
                do {
                    let json = try JSONDecoder().decode(SWPeople.self, from: data)
                    completion(json, nil)
//            print(json)
                json.people.forEach {
                    print($0.name)
                    }
                } catch let jsonError {
                print(jsonError)
                completion(nil, jsonError)
                }
            }
            }
        task.resume()
    }
}
