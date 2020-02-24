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

 let mytableView = TableVViewController()

class TableVViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    //weak var dataSource: UITableViewDataSource?
    
//    func getData() {
//        dataSource?.tableView(tableView, numberOfRowsInSection: 10)
//       dataSource?.tableView(tableView, cellForRowAt: indexPath)
//    }
    
    let segueID = "profileVC"
    
    //задаем число рядов таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //studentsNew.count
        return storageChild.tableView(tableView, numberOfRowsInSection: 10)
    }

    //определяем характеристики ячейки для кажprivate дого ряда
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        storageChild.tableView(tableView, cellForRowAt: indexPath)
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
        
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
        studentNameForProfileVC = studentsNew[indexPath.row].name
        studentSurnameForProfileVC = studentsNew[indexPath.row].surname
        

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
        
        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: CodeTableViewCell.id)
        tableView.register(UINib(nibName: "XIBTableViewCell", bundle: nil), forCellReuseIdentifier: XIBTableViewCell.id)
        
 //      mytableView.dataSource = storageChild
//        mytableView.getData()
    }

     //передача имени студента в ProfileVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileVC = segue.destination as? ProfileViewController {
            profileVC.profileNameLabelInformation = studentNameForProfileVC
            profileVC.profileSurnameLabelInformation = studentSurnameForProfileVC
        }
    }
   
    
    }


    
    


    

    



