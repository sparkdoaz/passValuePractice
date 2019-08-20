//
//  ViewController.swift
//  passValuePractice
//
//  Created by 黃建程 on 2019/8/20.
//  Copyright © 2019 Spark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //        tableView.rowHeight = UITableView.automaticDimension
        
        //        tableView.estimatedRowHeight = 300
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstCell else { fatalError() }
        cell.backgroundColor = .white
        cell.setBord()
        //        cell.deleteBtn.layer.borderColor = UIColor.black.cgColor
        
        return cell
        
    }
    
    
}

