//
//  ViewController.swift
//  TableViewDemo
//
//  Created by DragonLi on 2017/8/22.
//  Copyright © 2017年 im.juejin. All rights reserved.
//

import UIKit

let cellID = "SampleTableViewCell"

class ViewController: UIViewController {
    
    fileprivate  var sourceDatas = [String]()
    fileprivate var loadPageDatas = [String]()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 74, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        tableView.backgroundColor = .white
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
//        tableView.register(SampleTableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        
        tableView.register(UINib(nibName: "SampleTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        navigationItem.title = "tableViewDemo"
        view.addSubview(tableView)
        sourceDatas = ["LFL","DragonLi","tableView","Do not Click item","LFL","DragonLi","tableView","Do not Click item","LFL","DragonLi","tableView","Do not Click item"]
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let total = scrollView.contentSize.height
        let current = scrollView.contentOffset.y + UIScreen.main.bounds.height
        let page = "1"    // 计算当前下拉页码
        if loadPageDatas .contains(page) == false  && total - current  < 100{
            loadPageDatas.append(page)
              preLoading()
        }
    }

    func preLoading() {
        print("request Networking")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 120;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {  // click item
            showTip()
        } else {
            let closureVC = LFLBlockVC()
            closureVC.stringBlock = {
             print($0)
            }
           self.present(closureVC, animated: true, completion: nil)
            print(sourceDatas[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         // code style cell
         /*
         let  cell  = SampleTableViewCell.init(style: .default, reuseIdentifier:cellID)
         cell.textLabel?.text = "\(indexPath.row + 1)" + "." + "\(sourceDatas[indexPath.row])"
         return cell
         */
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellID) as! SampleTableViewCell
//        cell.headerImageView?.image = UIImage(named: "testPic")
        cell.headerImageView.image = UIImage.initImage(named: "testPic", size: cell.headerImageView.frame.size)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceDatas.count
    }
}

