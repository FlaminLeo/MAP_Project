//
//  Categories.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 22/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit

class Category {
    
    var catImg: UIImage
    
    var catName: String
    
    var catDesc: String
    
    var catID: Int16
    
    init(cateName: String, cateDescription: String, cateID: Int16, cateImg: String) {
        
        self.catName = cateName
        self.catDesc = cateDescription
        self.catID = cateID
        if let catImg = UIImage(named: cateImg) {
            self.catImg = catImg
        }else {
            self.catImg = (UIImage(named: "default"))!
        }
        
    }
}
