//
//  DataSourceFromNet.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/30/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import UIKit
// swiftlint:disable all

//class DataSourceFromNet: NSObject, UICollectionViewDataSource {
//
//        //2 обязательные функции DataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return NetworkManager.shared.swPeople?.people.count ?? 0
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.reuseID, for: indexPath) as! StudentCollectionViewCell
//        //изображения в ячейках в зависимости от пола
//        if NetworkManager.shared.swPeople?.people[indexPath.row].gender == "male" {
//            cell.studentImageView.image = UIImage(named: "boy")!
//        }
//        if NetworkManager.shared.swPeople?.people[indexPath.row].gender == "female" {
//            cell.studentImageView.image = UIImage(named: "girl")!
//        }
//        if NetworkManager.shared.swPeople?.people[indexPath.row].gender == "n/a" {
//            cell.studentImageView.image = UIImage(named: "user")!
//        }
//
//        cell.nameLabel.text = NetworkManager.shared.swPeople?.people[indexPath.row].name
//        addingCollectionViewDesign(cell: cell)
//
//        return cell
//    }
//
//    func addingCollectionViewDesign(cell: StudentCollectionViewCell) {
//          cell.backgroundColor = .white
//          cell.layer.cornerRadius = 5
//          cell.layer.shadowRadius = 9
//          //прозрачность тени
//          cell.layer.shadowOpacity = 0.3
//          //насколько отдаляется тень
//          cell.layer.shadowOffset = CGSize(width: 5, height: 8)
//              cell.clipsToBounds = false
//    }
//
//
//}
