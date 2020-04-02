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
    //swPeopleArray будет содержать полученные данные
    var swPeopleArray: [Student] = []
    var urlsArray: [URL] = []
    enum NumberOfLoading {
       case firstLoading, nextLoading
    }

///Func description: выполняется на background thread [однако completion (замыкание, которое обновляет collectionView) выполним на основном потоке]
    func getData(urlFor: NumberOfLoading, completion: @escaping () -> Void) {
        let session = URLSession.shared
//MARK: - First Loading
        switch urlFor {
        case .firstLoading:
            guard let url = URL(string: "https://swapi.co/api/people") else {return}
            let task = session.dataTask(with: url) {(data, response, error) in
                    if let error = error {
                        print(error)
                    }
                    guard let data = data else {return}
                    do {
                        let json = try JSONDecoder().decode(SWPeople.self, from: data)
                        json.people.forEach { (person) in
                        self.swPeopleArray.append(Student(name: person.name, surname: "", gender: person.gender, image: UIImage(named: "boy")!, height: person.height, mass: person.mass, hairColor: person.hairColor, skinColor: person.skinColor, eyeColor: person.eyeColor, birthYear: person.birthYear))
                        }
                        //запуск completion (замыкания, которое обновляет collectionView) обязательновыполним на основном потоке
                        DispatchQueue.main.async {
                        completion()
                        }
                    } catch let jsonError {
                        print(jsonError)
                    }
                }
            task.resume()
            
//MARK: - Next Loading
        case .nextLoading:
            guard let url2 = URL(string: "https://swapi.co/api/people/?page=2") else {return}
            guard let url3 = URL(string: "https://swapi.co/api/people/?page=3") else {return}
            urlsArray = [url2, url3]
            urlsArray.forEach { (one) in
                let task = session.dataTask(with: one) {(data, response, error) in
                    if let error = error {
                        print(error)

                    }
                    guard let data = data else {return}
                    do {
                        let json = try JSONDecoder().decode(SWPeople.self, from: data)
                        json.people.forEach { (person) in
                            self.swPeopleArray.append(Student(name: person.name, surname: "", gender: person.gender, image: UIImage(named: "boy")!, height: person.height, mass: person.mass, hairColor: person.hairColor, skinColor: person.skinColor, eyeColor: person.eyeColor, birthYear: person.birthYear))
                        }
                        //запуск completion (замыкания, которое обновляет collectionView) обязательновыполним на основном потоке
                        DispatchQueue.main.async {
                            completion()
                        }
                    } catch let jsonError {
                        print(jsonError)
                    }
                }
                task.resume()
            }
        }
    }
}
