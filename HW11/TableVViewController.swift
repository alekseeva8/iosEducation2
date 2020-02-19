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
    //var gender: Gender
    
    /* enum Gender {
    case male, female + сделать 2 разные прототипы ячеек на них
}
 */
    
    init(name: String, surname: String = "", age: Int = 20) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}
//var students: [Student] = [Student(name: "Аня"), Student(name: "Артем"), Student(name: "Олег"), Student(name: "Марта"), Student(name: "Юра"), Student(name: "Женя"), Student(name: "Таня"), Student(name: "Саша"), Student(name: "Алена"), Student(name: "Андрей"), Student(name: "Слава"), Student(name: "Игорь"), Student(name: "Лиза"), Student(name: "Паша"), Student(name: "Даша")]

var students: [Student] = []
var studentNameForProfileVC = ""

class TableVViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let segueID = "profileVC"
    
    //задаем число рядов таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    //определяем характеристики ячейки для каждого ряда
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        
        var studentCell: UITableViewCell
        switch indexPath.row % 4 {
        case 0:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name
        case 1:
            studentCell = tableView.dequeueReusableCell(withIdentifier: "yellow", for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name
        case 2:
            studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name
        default:
            studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name
        }
        return studentCell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
        studentNameForProfileVC = students[indexPath.row].name
        
    //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        performSegue(withIdentifier: segueID, sender: nil)
        
    }
    
    //функция редактирования рядов
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //важно удалить и из массива, и из таблички
        //удаление из источника данных(массива)
        if editingStyle == .delete {
        students.remove(at: indexPath.row)
        //удаление из таблички
       // tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.reloadData()
        }
    }
    
    func updateData() {
        tableView.reloadData()
    }

    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //вызов функции, переводящей Name.txt в массив имен. записываем его в массив students
        students = prepareArray()
        
        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: CodeTableViewCell.id)
        
        tableView.register(UINib(nibName: "XIBTableViewCell", bundle: nil), forCellReuseIdentifier: XIBTableViewCell.id)
        
    }

     //передача имени студента в ProfileVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileVC = segue.destination as? ProfileViewController {
            profileVC.profileNameLabelInformation = studentNameForProfileVC
        }
    }
    
    //функция, переводящяя Name.txt в массив имен
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
    
    


    

    



