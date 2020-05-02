//
//  SampleTableViewCell.swift
//  TableViewDemo
//
//  Created by DragonLi on 2017/8/22.
//  Copyright © 2017年 im.juejin. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.text = "testString"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
}





