//
//  CollectionViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit
// swiftlint:disable all

class CollectionViewController: UIViewController {
    let dataSourceFromNet = DataSourceFromNet()
    let networkManager = NetworkManager()
    //swPeople будет содержать полученные данные
    var swPeople: SWPeople? = nil

    var collectionView: UICollectionView
    @IBOutlet weak var labelStudents: UILabel!
    
    required init?(coder: NSCoder) {
    //создание collectionView (property viewcontroller) с UICollectionViewFlowLayout (non-customised, build-in layout)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = CGSize(width: 200, height: 300)
        layout.minimumLineSpacing = 10
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: StudentCollectionViewCell.reuseID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        
        collectionView.dataSource = dataSourceFromNet
        collectionView.delegate = self

        networkManager.getData(urlSuffix: 1) {(data, error) in
            self.swPeople = data
            self.collectionView.reloadData()
            }

//        dataSourceFromNet.fetchData()
//        collectionView.reloadData()

        collectionView.backgroundColor = .yellow
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
         //чтобы ячейки не доставали до краев collectionview на 20
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: labelStudents.bottomAnchor, constant: 8).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        //collectionView.heightAnchor.constraint(lessThanOrEqualToConstant: 350).isActive = true
        //collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
    }

         @IBAction func unwindToStudentsList(unwindSegue: UIStoryboardSegue) {}
}

        extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width - 20 - 20 - 10/2)/2
        return CGSize(width: itemWidth, height: 300)
    }

    //метод говорит делегату, какой выбран пользователем ряд (нажатием на ряд пользователем). здесь можно модифицировать ряд
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
        ProfileManager.shared.name = swPeople?.people[indexPath.row].name ?? ""
        ProfileManager.shared.height = swPeople?.people[indexPath.row].height ?? ""
        ProfileManager.shared.weight = swPeople?.people[indexPath.row].mass ?? ""
        ProfileManager.shared.hairColor = swPeople?.people[indexPath.row].hairColor ?? ""
        ProfileManager.shared.skinColor = swPeople?.people[indexPath.row].skinColor ?? ""
        ProfileManager.shared.eyeColor = swPeople?.people[indexPath.row].eyeColor ?? ""
        ProfileManager.shared.birthYear = swPeople?.people[indexPath.row].birthYear ?? ""
        ProfileManager.shared.gender = swPeople?.people[indexPath.row].gender ?? ""

        //загружаются разные стили профилей в зависимости от пола студента
        if swPeople?.people[indexPath.row].gender == "male" {
            performSegue(withIdentifier: "profile3VC", sender: nil)
        }
        if swPeople?.people[indexPath.row].gender == "female" {
            performSegue(withIdentifier: "profile2VC", sender: nil)
        }
        if swPeople?.people[indexPath.row].gender == "n/a" {
            performSegue(withIdentifier: "profileVC", sender: nil)
        }
    }
}

//extension CollectionViewController: UICollectionViewDataSource {
//
//    //2 обязательные функции DataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return swPeople?.people.count ?? 0
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.reuseID, for: indexPath) as! StudentCollectionViewCell
//        //изображения в ячейках в зависимости от пола
//        if swPeople?.people[indexPath.row].gender == "male" {
//            cell.studentImageView.image = UIImage(named: "boy")!
//        }
//        if swPeople?.people[indexPath.row].gender == "female" {
//            cell.studentImageView.image = UIImage(named: "girl")!
//        }
//        if swPeople?.people[indexPath.row].gender == "n/a" {
//            cell.studentImageView.image = UIImage(named: "user")!
//        }
//
//        cell.nameLabel.text = swPeople?.people[indexPath.row].name
//
//        cell.backgroundColor = .white
//        cell.layer.cornerRadius = 5
//        cell.layer.shadowRadius = 9
//        //прозрачность тени
//        cell.layer.shadowOpacity = 0.3
//        //насколько отдаляется тень
//        cell.layer.shadowOffset = CGSize(width: 5, height: 8)
//        cell.clipsToBounds = false
//        return cell
//    }
//}
