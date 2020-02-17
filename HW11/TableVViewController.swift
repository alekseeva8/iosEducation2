//
//  TableVViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

struct Student {
    var name: String
    var surname: String
    var age: Int
    
    init(name: String, surname: String = "", age: Int = 20) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}
var students: [Student] = [Student(name: "Аня"), Student(name: "Артем"), Student(name: "Олег"), Student(name: "Марта"), Student(name: "Юра"), Student(name: "Женя"), Student(name: "Таня"), Student(name: "Саша"), Student(name: "Алена"), Student(name: "Андрей"), Student(name: "Слава"), Student(name: "Игорь"), Student(name: "Лиза"), Student(name: "Паша"), Student(name: "Даша")]

//let dataNames = ["Аня", "Артем", "Олег", "Марта", "Юра", "Женя", "Таня", "Саша", "Алена", "Андрей", "Слава", "Игорь", "Лиза", "Паша", "Даша"]


class TableVViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //задаем число рядов
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    //определяем характеристики ячейки для каждого ряда
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        
        cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

    


