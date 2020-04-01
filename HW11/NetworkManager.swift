//
//  NetworkManager.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/25/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import  UIKit

class NetworkManager {
    //singleton
    static let shared = NetworkManager()
    private init() {
       }
    //swPeople будет содержать полученные данные
    var swPeopleArray: [Student] = []

///Func description: выполняется на background thread [однако completion (замыкание, которое обновляет collectionView) выполним на основном потоке]
    func getData(completion: @escaping () -> Void) {
        let session = URLSession.shared
//        let urlString = "https://swapi.co/api/"
        guard let url = URL(string: "https://swapi.co/api/people") else {return}
        guard let url2 = URL(string: "https://swapi.co/api/people/?page=2") else {return}
        guard let url3 = URL(string: "https://swapi.co/api/people/?page=3") else {return}
        //        guard let url = URL(string: "\(urlString)people") else {return}
        //        guard let url2 = URL(string: "\(urlString)people/?page=2") else {return}
        //        guard let url3 = URL(string: "\(urlString)people/?page=3") else {return}
        let urlArray: [URL] = [url, url2, url3]
        //добовляем компоненты
//        var components = URLComponents()
//        components.path = url.path
//        components.scheme = url.scheme
//        components.host = url.host
//        components.queryItems = [
//            URLQueryItem(name: "page", value: String(urlSuffix))
//        ]
//
//        var request = URLRequest(url: components.url!)
//        request.httpMethod = "GET"
        //let task = URLSession.shared.dataTask(with: url)
               urlArray.forEach { (oneUrl) in
                           let task = session.dataTask(with: oneUrl) {(data, response, error) in
                                   if let error = error {
                                       print(error)
                                   }
                                   guard let data = data else {return}
                                   do {
                                       let json = try JSONDecoder().decode(SWPeople.self, from: data)
        //                               self.swPeople = json
                                       json.people.forEach { (person) in
                                        self.swPeopleArray.append(Student(name: person.name, surname: "", gender: person.gender, image: UIImage(named: "boy")!))
                                       }
                                       //запуск completion (замыкания, которое обновляет collectionView) обязательновыполним на основном потоке
                                       DispatchQueue.main.async {
                                       completion()
                                       }
                       //            print(json)
                                   } catch let jsonError {
                                       print(jsonError)
                                   }
                               }
                           task.resume()
               }
    }
}
