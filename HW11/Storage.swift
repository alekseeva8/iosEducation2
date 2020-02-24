//
//  Storage.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/20/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class Storage: NSObject, UITableViewDataSource {
     
    
    var students: [Student] = []
    //weak var dataSource: UITableViewDataSource?
    //var data1: Int
    
    override init() {
    //записываем массив имен в массив students
        super.init()
        students = prepareArray()
//        data1 = tableView((tableView, numberOfRowsInSection: section))
    }
    
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
    
    
    //2 обязательные функции
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var studentCell: UITableViewCell
        switch studentsNew[indexPath.row].gender {
        case .male:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "male", for: indexPath)
            studentCell.textLabel?.text = studentsNew[indexPath.row].name
            studentCell.detailTextLabel?.text = studentsNew[indexPath.row].surname
        case .female:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "female", for: indexPath)
            studentCell.textLabel?.text = studentsNew[indexPath.row].name
            studentCell.detailTextLabel?.text = studentsNew[indexPath.row].surname
        }
        return studentCell
    }

    
    //функция, переводящяя Name.txt в массив имен. [при вызове запишем массив в массив students]
    func prepareArray() -> [Student] {
            var array: [Student] = []
            //ищем путь к файлу
            guard let path = Bundle.main.path(forResource: "Names", ofType: "txt") else {return []}
            var allStudentsString: String = ""
            //переводим содержимое файла в string
            do {
                allStudentsString = try String(contentsOfFile: path)
            } catch { }
            // сплитуем string и получаем substring
            let allStudentsSubstring = allStudentsString.split(separator: ",")
            // на каждой итерации перебора substring создаем экземпляр структуры и добавляем в новый пустой массив
            
            var studentSplitted: [Substring.SubSequence] = []
        
        for studentSubstring in allStudentsSubstring {
            studentSplitted = studentSubstring.split(separator: " ")
    
            let studentSplittedString = String(studentSplitted.last ?? "")
            
            if studentSplittedString == "муж" {
                array.append(Student(name: String(studentSplitted.first ?? ""), surname: String(studentSplitted[1]), gender: .male))
            }
            else {
               array.append(Student(name: String(studentSplitted.first ?? ""), surname: String(studentSplitted[1]), gender: .female))
            }
        }
        
            return array
    }
    
}
