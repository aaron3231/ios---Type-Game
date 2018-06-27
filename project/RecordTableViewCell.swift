//
//  RecordTableViewCell.swift
//  project
//
//  Created by Lab on 2018/6/26.
//  Copyright © 2018年 Lab. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var spend: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
