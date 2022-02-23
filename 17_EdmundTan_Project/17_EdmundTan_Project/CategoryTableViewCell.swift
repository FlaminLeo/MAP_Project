//
//  CategoryTableViewCell.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 22/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet var catImg: UIImageView!
    @IBOutlet var catName: UILabel!
    @IBOutlet var catDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
