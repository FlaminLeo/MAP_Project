//
//  SignUpViewController.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 16/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBAction func signUpBtn(_ sender: Any) {
        if usernameField.text == "" || passwordField.text == "" || confirmPasswordField.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Please fill in all fields", preferredStyle: UIAlertController.Style.alert)
                               
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                               
            self.present(alert, animated: true)
        }else {
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            let predicate = NSPredicate(format: "userName = '" + usernameField.text! + "'")
            
            fetchRequest.predicate = predicate
            do {
                let allUser = try viewContext.fetch(fetchRequest)
                if !allUser.isEmpty {
                    let alert = UIAlertController(title: "Alert", message: "User already exists, please use a different username", preferredStyle: UIAlertController.Style.alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    
                    self.present(alert, animated: true)
                }else {
                    insertUser()
                }
            }catch {
                print(error)
            }
        }
        
    }
    
    @IBAction func returnBtn(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    func insertUser() {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: viewContext) as! User
        
        user.userName = usernameField.text
        user.userPassword = passwordField.text
        user.credits = 200
        
        app.saveContext()
        print(user)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.white.cgColor, UIColor.orange.cgColor]
        layer.startPoint = CGPoint(x: 1, y: 1)
        layer.endPoint = CGPoint(x: 0.5, y: 1.9)
        
        view.layer.addSublayer(layer)
        view.layer.insertSublayer(layer, at: 0)
        
        // Do any additional setup after loading the view.
        viewContext = app.persistentContainer.viewContext
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
