//
//  TableVViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/17/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit


class TableVViewController: UIViewController, UITableViewDelegate {

    let storage = Storage()

    var studentNameForProfileVC = ""
    var studentSurnameForProfileVC = ""

    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = storage.students[indexPath.row]
        //tableView.deselectRow(at: indexPath, animated: true)
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
        studentNameForProfileVC = student.name
        studentSurnameForProfileVC = student.surname
        
        performSegue(withIdentifier: "profileVC" , sender: nil)
    }
    
    func updateData() {
        tableView.reloadData()
    }

    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.dataSource = storage
    }

     //передача имени студента в ProfileVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileVC = segue.destination as? ProfileViewController {
            profileVC.profileNameLabelInformation = studentNameForProfileVC
            profileVC.profileSurnameLabelInformation = studentSurnameForProfileVC
        }
    }
   
    
    }


    
    


    

    



