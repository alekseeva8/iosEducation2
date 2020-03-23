//
//  CollectionViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let dataSourceOfCV = DataSource()
    var students = DataSource().students
    
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
        
        collectionView.dataSource = dataSourceOfCV
        collectionView.delegate = self
        
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
