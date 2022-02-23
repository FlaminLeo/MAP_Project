//
//  Products.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 22/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit

class Product {
    
    var prodName: String
    
    var prodPrice: Int16
    
    var prodDesc: String
    
    var prodID: Int16
    
    var prodCatID: Int16
    
    var prodImg: UIImage
    
    init(proName: String, proPrice: Int16, proDesc: String, proID: Int16, proCatID: Int16, proImg: String) {
        
        self.prodName = proName
        self.prodPrice = proPrice
        self.prodDesc = proDesc
        self.prodID = proID
        self.prodCatID = proCatID
        
        if let prodImg = UIImage(named: proImg) {
            self.prodImg = prodImg
        }else{
            self.prodImg = (UIImage(named: "default"))!
        }
    }
}
