//
//  TableVViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

let storageChild = Storage()
var studentsNew = storageChild.students

var studentNameForProfileVC = ""
var studentSurnameForProfileVC = ""

class TableVViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let segueID = "profileVC"
    
    
    //задаем число рядов таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentsNew.count
    }
    //определяем характеристики ячейки для каждого ряда
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        
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
        
//        switch indexPath.row % 4 {
//        case 0:
//            studentCell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
//            studentCell.textLabel?.text = studentsNew[indexPath.row].name
//        case 1:
//            studentCell = tableView.dequeueReusableCell(withIdentifier: "yellow", for: indexPath)
//            studentCell.textLabel?.text = studentsNew[indexPath.row].name
//            studentCell.detailTextLabel?.text = studentsNew[indexPath.row].surname
//        case 2:
//            studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
//            studentCell.textLabel?.text = studentsNew[indexPath.row].name
//        default:
//            studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
//            studentCell.textLabel?.text = studentsNew[indexPath.row].name
//        }
        
        return studentCell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
        studentNameForProfileVC = studentsNew[indexPath.row].name
        studentSurnameForProfileVC = studentsNew[indexPath.row].surname
        
    //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        performSegue(withIdentifier: segueID, sender: nil)
        
    }
    
    //функция редактирования рядов
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //важно удалить и из массива, и из таблички
        //удаление из источника данных(массива)
        if editingStyle == .delete {
        studentsNew.remove(at: indexPath.row)
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
        
//        let storageChild = Storage()
//        let studentsNew = storageChild.students
        
        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: CodeTableViewCell.id)
        
        tableView.register(UINib(nibName: "XIBTableViewCell", bundle: nil), forCellReuseIdentifier: XIBTableViewCell.id)
        
    }

     //передача имени студента в ProfileVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileVC = segue.destination as? ProfileViewController {
            profileVC.profileNameLabelInformation = studentNameForProfileVC
            profileVC.profileSurnameLabelInformation = studentSurnameForProfileVC
        }
    }
    
    }
    
    


    

    



