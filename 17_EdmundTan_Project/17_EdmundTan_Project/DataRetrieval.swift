//
//  DataRetrieval.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 17/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit
import CoreData

let app = UIApplication.shared.delegate as! AppDelegate
var viewContext: NSManagedObjectContext! = app.persistentContainer.viewContext

func retrieveWelcome(Username: String) -> User {
    let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
    
    let predicate = NSPredicate(format: "userName = '" + Username + "'")
    
    fetchRequest.predicate = predicate
    
    var allUser:[User]!
    do {
        allUser = try viewContext.fetch(fetchRequest)
    }catch {
        print(error)
    }
    return allUser[0]
}

func addProduct(Name: String, ID: Int16, CatID: Int16, Desc: String, Img: String, Price: Int16) {
    
    let products = NSEntityDescription.insertNewObject(forEntityName: "Products", into: viewContext) as! Products
    
    products.productName = Name
    products.productID = ID
    products.productCategoryID = CatID
    products.productDescription = Desc
    products.productImage = Img
    products.productPrice = Price
    
    app.saveContext()
}

func addCategory(Name: String, ID: Int16, Desc: String, Img: String ) {
    
    let categories = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: viewContext) as! Categories
    
    categories.categoryName = Name
    categories.categoryID = ID
    categories.categoryDescription = Desc
    categories.categoryImage = Img

    app.saveContext()
}

func retrieveCategory() -> [Categories]{
    
    let fetchRequest: NSFetchRequest<Categories> = Categories.fetchRequest()
    
    var allCategories:[Categories]!

    do {
        allCategories = try viewContext.fetch(fetchRequest)
        for category in allCategories {
            var catName = category.categoryName
            var catID = category.categoryID
            var catDesc = category.categoryDescription
            var catImg = category.categoryImage
        }
    }catch {
        print(error)
    }
    return allCategories
    
}

func retrieveProducts(ID: Int16) -> [Products] {
    
    let fetchRequest: NSFetchRequest<Products> = Products.fetchRequest()
    
    let predicate = NSPredicate(format: "productCategoryID = '" + String(ID) + "'")
    
    fetchRequest.predicate = predicate
    var idProducts:[Products]!
    
    do {
        idProducts = try viewContext.fetch(fetchRequest)
        for products in idProducts {
            var productName = products.productName
            var productID = products.productID
            var productDesc = products.productDescription
            var productPrice = products.productPrice
        }
    }catch {
        print(error)
    }
    
    return idProducts
}
