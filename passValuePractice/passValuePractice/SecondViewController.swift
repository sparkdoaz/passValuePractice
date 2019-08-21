//
//  SecondViewController.swift
//  passValuePractice
//
//  Created by 黃建程 on 2019/8/20.
//  Copyright © 2019 Spark. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //👇是 SecondVC 利用 delegate 傳值到 FirstVC
    weak var delegate:SecondViewControllerDelegate?
    
    //👇是 SecondVC 利用 delegate 傳值到 FirstVC
    var passIndexPath: Int?
    
    //👇是 SecondVC 利用 closure 傳值到 FirstVC
    var passTextclosure: (() -> ())?
    
    let textField = UITextField()
    
    let uibutton = UIButton()
    
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
        
        view.backgroundColor = .white
        view.addSubview(uibutton)
        view.addSubview(textField)
        
        setConstraint()
        
        uibutton.addTarget(self, action: #selector(passDataToFirstVC), for: .touchUpInside)
    }
    
    @objc func passDataToFirstVC() {

        navigationController?.popViewController(animated: true)
        
        //👇是 SecondVC 利用 delegate 傳值到 FirstVC
//        if passIndexPath != nil {
//            //修改
//            delegate?.delegateModifyData()
//        } else {
//            //新增
//            delegate?.delegateAddData()
//        }
        
        //👇是 SecondVC 利用 closure 傳值到 FirstVC
        guard let passTextclosure = passTextclosure else {return}
        passTextclosure()
    }
}

//👇是 SecondVC 利用 delegate 傳值到 FirstVC
protocol SecondViewControllerDelegate: AnyObject {
    
    func delegateModifyData()
    
    func delegateAddData()
    
}
