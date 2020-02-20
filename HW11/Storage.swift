//
//  Storage.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/20/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class Storage {
    var students: [Student]
    init() {
        students = []
    //записываем массив имен в массив students
        students = prepareArray()
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
