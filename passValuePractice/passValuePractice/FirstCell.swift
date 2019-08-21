//
//  FirstCell.swift
//  passValuePractice
//
//  Created by 黃建程 on 2019/8/20.
//  Copyright © 2019 Spark. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell {
    
    //👇是 Cell 利用 delegate 傳值到 FirstVC
    weak var delegate: FirstCellDelegate? 
    
    @IBOutlet weak var deleteBtn: UIButton! {
        
        //👇是 Cell 利用 delegate 傳值到 FirstVC
//        didSet {
//            deleteBtn.addTarget(self, action: #selector(deleteDataIBAction), for: .touchUpInside)
//        }
        
        
        //👇是 cell 利用 closure 傳值到 FirstVC，並且用 addTarget 去生成 function
        didSet {
            deleteBtn.addTarget(self, action: #selector(deleteDataIBACtionClosure), for: .touchUpInside)
        }
    }

    
    @IBOutlet weak var label: UILabel!
    func setBord() {
        deleteBtn.layer.masksToBounds = true
        deleteBtn.layer.borderWidth = 3
        deleteBtn.layer.borderColor = UIColor.orange.cgColor
        deleteBtn.layer.cornerRadius = 5
    }
    
    //👇是 Cell 利用 delegate 傳值到 FirstVC
    @objc func deleteDataIBAction(sender: UIButton) {
        delegate?.deleteData(self)
    }
    
    //👇是 cell 利用 closure 傳值到 FirstVC
    var closure: ((FirstCell) -> ())!
    
    ////👇是 Cell 利用 closure 傳值到 FirstVC
    @objc func deleteDataIBACtionClosure() {
        closure(self)
    }
    
}

//👇是 Cell 利用 delegate 傳值到 FirstVC
protocol FirstCellDelegate: AnyObject {
    
    func deleteData(_ cell: FirstCell)
    
}
