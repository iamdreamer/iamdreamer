//
//  StudentDataTableViewCell.swift
//  CloudsAPP
//
//  Created by mike on 2017/8/7.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class StudentDataTableViewCell: UITableViewCell {
    
    //UI 連結
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
