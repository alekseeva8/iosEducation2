//
//  TableVViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

let storage = Storage()
var students = storage.students

class TableVViewController: UIViewController {
//    var studentNameForProfileVC = ""
//    var studentSurnameForProfileVC = ""
    @IBOutlet weak var tableView: UITableView!
    //обновляет данные таблицы, когда user вновь открывает таблицу
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.dataSource = storage
    }
    //нажатие на кнопку Edit 
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }

    //передача имени студента в ProfileVC
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let profileVC = segue.destination as? ProfileViewController {
//            profileVC.profileNameLabelInformation = ProfileManager.shared.name
//            profileVC.profileSurnameLabelInformation = ProfileManager.shared.surname
//        }
//    }
    }

extension TableVViewController: UITableViewDelegate {
       //метод говорит делегату, какой выбран пользователем ряд (нажатием на ряд пользователем).
       //здесь можно модифицировать ряд
       //здесь передаем значения имени и фамилии выбранного пользователем ряда в ProfileVC
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //tableView.deselectRow(at: indexPath, animated: true)
           //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
           ProfileManager.shared.name = students[indexPath.row].name
           ProfileManager.shared.surname = students[indexPath.row].surname
        //загружаются разные стили профилей в зависимости от пола студента
        switch students[indexPath.row].gender {
        case .male:
            performSegue(withIdentifier: "profile3VC", sender: nil)
        case .female:
            performSegue(withIdentifier: "profile2VC", sender: nil)
       }
}
}
