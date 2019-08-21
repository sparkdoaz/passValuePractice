//
//  SecondViewController.swift
//  passValuePractice
//
//  Created by 黃建程 on 2019/8/20.
//  Copyright © 2019 Spark. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate:SecondViewControllerDelegate?
    
    let textField = UITextField()
    
    let uibutton = UIButton()
    
    var passIndexPath: Int?
    
    func setConstraint() {
        uibutton.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2 / 3),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            uibutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uibutton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            uibutton.heightAnchor.constraint(equalToConstant: 40),
            uibutton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2 / 3)
    ])
        textField.backgroundColor = .red
        uibutton.backgroundColor = .blue
        uibutton.setTitle("按我", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        view.addSubview(uibutton)
        view.addSubview(textField)
        print("1111")
        setConstraint()
        
        uibutton.addTarget(self, action: #selector(passDataToFirstVC), for: .touchUpInside)
    }
    
    @objc func passDataToFirstVC() {

        navigationController?.popViewController(animated: true)
        
        if passIndexPath != nil {
            //修改
            delegate?.passData(self)
        } else {
            //新增
            delegate?.addData(self)
        }
        
    }
}

protocol SecondViewControllerDelegate: AnyObject {
    func passData(_ vc: SecondViewController)
    
    func addData(_ vc: SecondViewController)
}
