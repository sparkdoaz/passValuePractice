//
//  ViewController.swift
//  passValuePractice
//
//  Created by 黃建程 on 2019/8/20.
//  Copyright © 2019 Spark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nextVC = SecondViewController()
    
//    var nextVCTwo: SecondViewController! {
//        didSet {
//            nextVCTwo.delegate = self
//        }
//    }


    @IBOutlet weak var tableView: UITableView!
    
    var fake = ["2", "3", "4", "5", "6", "7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.rowHeight = UITableView.automaticDimension
        
        //tableView.estimatedRowHeight = 300
        
        let barbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(btnShowNextVC))
        
        navigationItem.rightBarButtonItem = barbutton
        
        nextVC.delegate = self
        
//        nextVCTwo = SecondViewController()
    }
    
    @objc func btnShowNextVC() {
        
        navigationController?.show(nextVC, sender: nil)
        nextVC.textField.text = ""
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.deselectRow(at: indexPath, animated: true)
        
        nextVC.textField.text = fake[indexPath.row]
        
        show(nextVC, sender: nil)
        
        print(indexPath)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fake.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstCell else { fatalError() }
        
        cell.backgroundColor = .white
        cell.label.text = fake[indexPath.row]
        cell.setBord()
        
        //closure
//        cell.firstVC = self
        
        cell.closure = { cell -> () in
//            print(cell)
            self.fake.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        //delegate的方式
//        cell.delegate = self
        
        //addtarget 的方式
//        cell.deleteBtn.tag = indexPath.row
//        cell.deleteBtn.addTarget(self, action: #selector(clickedDelete(sender:)), for: .touchUpInside)
//        
        
        return cell
        
    }
    
    
    @objc func clickedDelete(sender: UIButton) {
        print(sender.tag)
//        print(fake)
        fake.remove(at: sender.tag)
//        let indexpath = tableView.indexPath(for: sender)
        //我要動畫！！！！
//        UIView.animate(withDuration: 2) {
//            let indexPath = IndexPath(row: sender.tag, section: 0)
//            self.tableView.deleteRows(at: [indexPath], with: .top)
//        }
        self.tableView.reloadData()
    }
    
}

extension ViewController: FirstCellDelegate {
    func deleteData(_ cell: FirstCell) {
        print("okokokokokok")

        guard let indexPath = tableView.indexPath(for: cell) else {return}
        
        //以下是完美的搭配。
        fake.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .top)
        
    }
}

extension ViewController: SecondViewControllerDelegate {
    func passData(_ vc: SecondViewController) {
        print("okokok")
//        vc.textField.text =
    }
    
    
    
    
}
