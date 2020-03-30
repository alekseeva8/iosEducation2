//
//  CollectionViewController.swift
//  HW11
//
//  Created by Elena Alekseeva on 3/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    //let dataSourceFromNet = DataSourceFromNet()
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionViewLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: StudentCollectionViewCell.reuseID)

        networkManager.getData(urlSuffix: 1) {(data, error) in
            self.swPeople = data
            self.collectionView.reloadData()
            }
    }
    
         @IBAction func unwindToStudentsList(unwindSegue: UIStoryboardSegue) {}
}


        
