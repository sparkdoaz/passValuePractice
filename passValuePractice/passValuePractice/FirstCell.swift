//
//  FirstCell.swift
//  passValuePractice
//
//  Created by 黃建程 on 2019/8/20.
//  Copyright © 2019 Spark. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell {
    
    weak var delegate: FirstCellDelegate?
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    func setBord() {
        deleteBtn.layer.masksToBounds = true
        deleteBtn.layer.borderWidth = 3
        deleteBtn.layer.borderColor = UIColor.orange.cgColor
        deleteBtn.layer.cornerRadius = 10
    }
}
protocol FirstCellDelegate: AnyObject {
    
}
