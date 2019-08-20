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
    
    @IBOutlet weak var deleteBtn: UIButton! {
        //delegate 方式 以下 偽IB Action
//        didSet {
//            deleteBtn.addTarget(self, action: #selector(deleteDataIBAction), for: .touchUpInside)
//        }
        //delegate 方式 以上
        
        didSet {
            deleteBtn.addTarget(self, action: #selector(deleteDataIBACtionClosure), for: .touchUpInside)
        }
    }
    
    var closure: ((FirstCell) -> ())!
    
    @IBOutlet weak var label: UILabel!
    func setBord() {
        deleteBtn.layer.masksToBounds = true
        deleteBtn.layer.borderWidth = 3
        deleteBtn.layer.borderColor = UIColor.orange.cgColor
        deleteBtn.layer.cornerRadius = 5
    }
    
    //delegate 方式
    @objc func deleteDataIBAction(sender: UIButton) {
        delegate?.deleteData(self)
    }
    
    //clousure
    @objc func deleteDataIBACtionClosure() {
        closure(self)
    }
    
}
protocol FirstCellDelegate: AnyObject {
    
    func deleteData(_ cell: FirstCell)
    
}
