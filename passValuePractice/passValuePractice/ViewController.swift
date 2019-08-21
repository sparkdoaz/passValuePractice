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

        let barbutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(btnShowNextVC))
        
        navigationItem.rightBarButtonItem = barbutton
        
        //👇是 SecondVC 利用 delegate 傳值到 FirstVC
//        nextVC.delegate = self
        
//        nextVCTwo = SecondViewController()
    }
    
    @objc func btnShowNextVC() {
        
        navigationController?.show(nextVC, sender: nil)
        nextVC.textField.text = ""
        
        //👇是 SecondVC 利用 closure 傳值到 FirstVC
        nextVC.passTextclosure = {
            guard let text = self.nextVC.textField.text else { return}
            self.fake.append(text)
            self.tableView.reloadData()
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //👇是動畫
        tableView.deselectRow(at: indexPath, animated: true)
        
        nextVC.textField.text = fake[indexPath.row]
        nextVC.passIndexPath = indexPath.row
        
        show(nextVC, sender: nil)
        
//        btnShowNextVC()
        
        //👇是 SecondVC 利用 closure 傳值到 FirstVC
        nextVC.passTextclosure = {
            self.fake[indexPath.row] = self.nextVC.textField.text!
            tableView.reloadData()
        }
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
        
        //👇是 Cell 利用 closure 傳值到 FirstVC
        cell.closure = { cell -> () in

            self.fake.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        
        //👇是 Cell 利用 delegate 傳值到 FirstVC
        //delegate的方式
//        cell.delegate = self
        
        //👇是 Cell 利用 addTarget 傳值到 FirstVC
        //addtarget 的方式
//        cell.deleteBtn.tag = indexPath.row
//        cell.deleteBtn.addTarget(self, action: #selector(clickedDelete(sender:)), for: .touchUpInside)

        return cell
        
    }
    
    //👇是 Cell 利用 addTarget 傳值到 FirstVC
    @objc func clickedDelete(sender: UIButton) {
        print(sender.tag)
//        print(fake)
        fake.remove(at: sender.tag)
        
//        super.view 找indexpath 找到cell後，拿cell去問tablecview的 indexpath
        
//        let indexpath = tableView.indexPath(for: sender)
        //我要動畫！！！！
//        UIView.animate(withDuration: 2) {
//            let indexPath = IndexPath(row: sender.tag, section: 0)
//            self.tableView.deleteRows(at: [indexPath], with: .top)
//        }
//        self.tableView.reloadData()
    }
    
}

//👇是 Cell 利用 delegate 傳值到 FirstVC
extension ViewController: FirstCellDelegate {
    func deleteData(_ cell: FirstCell) {

        guard let indexPath = tableView.indexPath(for: cell) else {return}
        
        //以下是完美的搭配。
        fake.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .top)
        
    }
}

//MARK: SecondVC Delegate
//👇是 SecondVC 利用 delegate 傳值到 FirstVC
extension ViewController: SecondViewControllerDelegate {
    
    func delegateAddData() {
        
        guard let text = nextVC.textField.text else { return}
        
        if text == "" {
            return
        }
        
        fake.append(text)
        
        tableView.reloadData()
        
        print("這邊是利用delegate，將SecondVC的值傳回FirstVC")
    }
    
    func delegateModifyData() {
        
        guard let indexPath = nextVC.passIndexPath else { return }
        
        nextVC.passIndexPath = nil //要歸零。
        
        fake[indexPath] = nextVC.textField.text ?? "no"
        
        tableView.reloadData()
        
        print("這邊是利用delegate，將SecondVC的值傳回FirstVC")
    }
}
