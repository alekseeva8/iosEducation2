//
//  CodeTableViewCell.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class CodeTableViewCell: UITableViewCell {
    
    static let id = "CodeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
     fatalError()
    }
    
    // вызывается когда метод инициализируется из xib.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code. вызывается когда метод инициализируется из xib
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
