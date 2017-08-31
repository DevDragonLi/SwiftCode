//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by DragonLi on 2017/8/31.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import UIKit

private let cellIDString = "cellIDString"

class ViewController: UIViewController {
    
    lazy var sourceDatas : [String] =  {
        let sourceDatas = ["UIBaseUserPartOne"]
        return sourceDatas
    }()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "RxSwiftDemo"
        view.backgroundColor = UIColor.gray
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIDString)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

// MARK: - Delegate
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return sourceDatas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellIDString, for: indexPath)
        cell.textLabel?.text = "\(sourceDatas[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        pushToVC(stringVC: sourceDatas[indexPath.row])
    }
}
// MARK: - handle push VC
extension ViewController {
    
    fileprivate func pushToVC(stringVC:String){
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleName"] as? String else {
            return
        }
        guard let VC_Class = NSClassFromString(nameSpace + "." + stringVC) else {
            return
        }
        guard let VC_Type = VC_Class as? UIViewController.Type else {
            return
        }
        let pushVC = VC_Type.init()
        pushVC.view.backgroundColor = UIColor.white
        self.navigationController!.pushViewController(pushVC, animated: true)
    }
}





