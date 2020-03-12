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
     override init() {
    //записываем массив имен в массив students
        super.init()
        students = prepareArray()
    }
    //2 обязательные функции DataSource
    //задаем число рядов таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    //определяем характеристики ячейки для кажprivate дого ряда
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var studentCell: UITableViewCell
        switch students[indexPath.row].gender {
        case .male:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "male", for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name
            studentCell.detailTextLabel?.text = students[indexPath.row].surname
        case .female:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "female", for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name
            studentCell.detailTextLabel?.text = students[indexPath.row].surname
        }
        //подключение таблицы к режиму редактирования.
        //вызывает метод tableView(moveRowAt) и вызывает tableView(editingStyleForRowAt)
        studentCell.showsReorderControl = true
        return studentCell
    }
}

extension Storage {
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
                array.append(Student(name: String(studentSplitted.first ?? ""),
                surname: String(studentSplitted[1]), gender: .male))
            } else {
               array.append(Student(name: String(studentSplitted.first ?? ""),
               surname: String(studentSplitted[1]), gender: .female))
            }
        }
            return array
    }
    //функция редактирования рядов (DataSource)
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt
           indexPath: IndexPath) {
           //важно удалить и из массива, и из таблички
           //удаление из источника данных(массива)
           if editingStyle == .delete {
           students.remove(at: indexPath.row)
           //удаление из таблички
          // tableView.deleteRows(at: [indexPath], with: .fade)
           tableView.reloadData()
           }
       }
        //определяет стиль редактирования для ряда. здесь функция убирает круглый значек удаления
    //    func tableView(_ tableView: UITableView,
    //editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //        return .none
    //    }
   }
