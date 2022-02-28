//
//  ProductTableViewCell.swift
//  17_EdmundTan_Project
//
//  Created by Angela Loo on 28/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var prodImg: UIImageView!
    @IBOutlet weak var prodDesc: UILabel!
    @IBOutlet weak var prodName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
