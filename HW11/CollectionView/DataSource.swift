//
//  DataSource.swift
//  HW11
//
//  Created by Elena Alekseeva on 8/31/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import UIKit
// swiftlint:disable all

//class DataSource: NSObject, UICollectionViewDataSource {
//    
//    var students: [Student] = []
//     // в инициализатор экземпляра класса записываем массив имен в массив students
//         override init() {
//         super.init()
//        students = prepareArray()
//    }
//    //2 обязательные функции DataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        students.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.reuseID, for: indexPath) as! StudentCollectionViewCell
//        cell.studentImageView.image = students[indexPath.row].image
//        cell.nameLabel.text = students[indexPath.row].name
//        cell.surnameLabel.text = students[indexPath.row].surname
//        cell.backgroundColor = .white
//        cell.layer.cornerRadius = 5
//        cell.layer.shadowRadius = 9
//        //прозрачность тени
//        cell.layer.shadowOpacity = 0.3
//        //насколько отдаляется тень
//        cell.layer.shadowOffset = CGSize(width: 5, height: 8)
//        cell.clipsToBounds = false
//        return cell
//    }
//}
//
//extension DataSource {
//    //функция, переводящяя Name.txt в массив имен. [при вызове запишем массив в массив students]
//    func prepareArray() -> [Student] {
//            var array: [Student] = []
//            //ищем путь к файлу
//            guard let path = Bundle.main.path(forResource: "Names", ofType: "txt") else {return []}
//            var allStudentsString: String = ""
//            //переводим содержимое файла в string
//            do {
//                allStudentsString = try String(contentsOfFile: path)
//            } catch { }
//            // сплитуем string и получаем substring
//            let allStudentsSubstring = allStudentsString.split(separator: ",")
//            // на каждой итерации перебора substring создаем экземпляр структуры и добавляем в новый пустой массив
//            var studentSplitted: [Substring.SubSequence] = []
//        for studentSubstring in allStudentsSubstring {
//            studentSplitted = studentSubstring.split(separator: " ")
//            let studentSplittedString = String(studentSplitted.last ?? "")
//            if studentSplittedString == "муж" {
//                array.append(Student(name: String(studentSplitted.first ?? ""), surname: String(studentSplitted[1]), gender: .male, image: UIImage(named: "boy")!))
//            } else {
//               array.append(Student(name: String(studentSplitted.first ?? ""),
//               surname: String(studentSplitted[1]), gender: .female, image: UIImage(named: "girl")!))
//            }
//        }
//            return array
//    }
//  
//   }
