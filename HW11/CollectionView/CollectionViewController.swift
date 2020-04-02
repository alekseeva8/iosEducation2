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
    //let dataSourceFromNet = DataSourceFromNet()

    var collectionView: UICollectionView
    @IBOutlet weak var labelStudents: UILabel!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    required init?(coder: NSCoder) {
    //создание collectionView (property viewcontroller) с UICollectionViewFlowLayout (non-customised, build-in layout)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = CGSize(width: 200, height: 300)
        layout.minimumLineSpacing = 10
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionViewLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: StudentCollectionViewCell.reuseID)

        collectionView.addSubview(activityIndicator)
        activityIndicatorLayout()
        activityIndicator.startAnimating()

        NetworkManager.shared.getData {[weak self] in
            self?.activityIndicator.stopAnimating()
            self?.collectionView.reloadData()
            }
    }
    
         @IBAction func unwindToStudentsList(unwindSegue: UIStoryboardSegue) {}
}


//MARK: - Data Source
extension CollectionViewController: UICollectionViewDataSource {

    //2 обязательные функции DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if NetworkManager.shared.swPeopleArray.count != 0 {
            activityIndicator.isHidden = true
        }
        return NetworkManager.shared.swPeopleArray.count
        
    }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.reuseID, for: indexPath) as! StudentCollectionViewCell
        //изображения в ячейках в зависимости от пола
    if NetworkManager.shared.swPeopleArray[indexPath.row].gender == "male" {
            cell.studentImageView.image = UIImage(named: "boy")!
        }
        if NetworkManager.shared.swPeopleArray[indexPath.row].gender == "female" {
            cell.studentImageView.image = UIImage(named: "girl")!
        }
        if NetworkManager.shared.swPeopleArray[indexPath.row].gender == "n/a" || NetworkManager.shared.swPeopleArray[indexPath.row].gender == "none" {
            cell.studentImageView.image = UIImage(named: "user")!
        }

    cell.nameLabel.text = NetworkManager.shared.swPeopleArray[indexPath.row].name
        collectionViewDesign(cell: cell)

        return cell
    }

    func collectionViewDesign(cell: StudentCollectionViewCell) {
          cell.backgroundColor = .white
          cell.layer.cornerRadius = 5
          cell.layer.shadowRadius = 9
          //прозрачность тени
          cell.layer.shadowOpacity = 0.3
          //насколько отдаляется тень
          cell.layer.shadowOffset = CGSize(width: 5, height: 8)
              cell.clipsToBounds = false
    }

    func activityIndicatorLayout() {
        activityIndicator.color = .systemBlue
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        activityIndicator.hidesWhenStopped = true
    }
}

//MARK: - Layout
extension CollectionViewController {
    func collectionViewLayout() {
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
}

//MARK: - Delegate
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width - 20 - 20 - 10/2)/2
        return CGSize(width: itemWidth, height: 300)
    }
//MARK: - DidSelect method
    //метод говорит делегату, какой выбран пользователем ряд (нажатием на ряд пользователем). здесь можно модифицировать ряд
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //достаем имя студента из ячейки (для дальнейшей передачи в ProfileVC)
        ProfileManager.shared.name = NetworkManager.shared.swPeopleArray[indexPath.row].name
        ProfileManager.shared.height = NetworkManager.shared.swPeopleArray[indexPath.row].height
        ProfileManager.shared.weight = NetworkManager.shared.swPeopleArray[indexPath.row].mass
        ProfileManager.shared.hairColor = NetworkManager.shared.swPeopleArray[indexPath.row].hairColor
        ProfileManager.shared.skinColor = NetworkManager.shared.swPeopleArray[indexPath.row].skinColor
        ProfileManager.shared.eyeColor = NetworkManager.shared.swPeopleArray[indexPath.row].eyeColor
        ProfileManager.shared.birthYear = NetworkManager.shared.swPeopleArray[indexPath.row].birthYear
        ProfileManager.shared.gender = NetworkManager.shared.swPeopleArray[indexPath.row].gender

        //загружаются разные стили профилей в зависимости от пола студента
        if NetworkManager.shared.swPeopleArray[indexPath.row].gender == "male" {
            performSegue(withIdentifier: "profile3VC", sender: nil)
        }
        if NetworkManager.shared.swPeopleArray[indexPath.row].gender == "female" {
            performSegue(withIdentifier: "profile2VC", sender: nil)
        }
        if NetworkManager.shared.swPeopleArray[indexPath.row].gender == "n/a" || NetworkManager.shared.swPeopleArray[indexPath.row].gender == "none" {
            performSegue(withIdentifier: "profileVC", sender: nil)
        }
    }
    }

