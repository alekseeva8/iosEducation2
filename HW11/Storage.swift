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
        var age: Int
//        var gender: Gender
//
//        enum Gender {
//        case male, female
//    }
        init(name: String, surname: String = "", age: Int = 20) {
            self.name = name
            self.surname = surname
            self.age = age
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
            let splittedNames = allStudentsString.split(separator: ",")
            // на каждой итерации перебора substring создаем экземпляр структуры и добавляем в новый пустой массив
            splittedNames.forEach { name in
                array.append(Student(name: String(name)))
            }
            
            return array
    }
    
}
