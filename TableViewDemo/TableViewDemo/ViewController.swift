//
//  ViewController.swift
//  TableViewDemo
//
//  Created by DragonLi on 2017/8/22.
//  Copyright © 2017年 im.juejin. All rights reserved.
//

import UIKit

let cellID = "cellID"

class ViewController: UIViewController {
    
    var sourceDatas = [String]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 74, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        tableView.backgroundColor = .white
        tableView.tableHeaderView = UIView()
//        tableView.tableFooterView = UIView()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.register(SampleTableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        navigationItem.title = "tableViewDemo"
        view.addSubview(tableView)
        sourceDatas = ["LFL","DragonLi","tableView","Do not Click item"]
        tableView.reloadData()
    }
    
    func showTip() {
        
        let tip  = UIAlertController(title: "Click Tips", message: "why are you Click this item", preferredStyle: .alert)
       
        let diss = UIAlertAction(title: "Wrong operation", style: .default) { (action) in
        }
        let sure = UIAlertAction(title: "continue operation", style:.cancel) { (action) in
        }
        tip.addAction(diss)
        tip.addAction(sure)
        self.present(tip, animated: false) { }
    }
}

//MARK:UITableView Delegates
extension ViewController : UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 50;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {  // click item
            showTip()
        } else {
            print(sourceDatas[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell  = SampleTableViewCell.init(style: .default, reuseIdentifier:cellID)
        cell.textLabel?.text = "\(indexPath.row + 1)" + "." + "\(sourceDatas[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceDatas.count
    }
}

