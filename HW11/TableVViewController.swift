//
//  TableVViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

let storageChild = Storage()
var students = storageChild.students

var studentNameForProfileVC = ""
var studentSurnameForProfileVC = ""


class TableVViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
        studentNameForProfileVC = students[indexPath.row].name
        studentSurnameForProfileVC = students[indexPath.row].surname
        
        performSegue(withIdentifier: "profileVC" , sender: nil)
    }
    
    func updateData() {
        tableView.reloadData()
    }

    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.dataSource = storageChild
    }

     //передача имени студента в ProfileVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileVC = segue.destination as? ProfileViewController {
            profileVC.profileNameLabelInformation = studentNameForProfileVC
            profileVC.profileSurnameLabelInformation = studentSurnameForProfileVC
        }
    }
   
    
    }


    
    


    

    



