//
//  XIBTableViewCell.swift
//  HW11
//
//  Created by Elena Alekseeva on 2/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class XIBTableViewCell: UITableViewCell {
    
    static let id = "XIBTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
