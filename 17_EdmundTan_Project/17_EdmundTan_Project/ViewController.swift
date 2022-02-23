//
//  ViewController.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 15/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
        if usernameField.text == "" || passwordField.text == "" {
            
        }else {
            login(Username: usernameField.text!, Password: passwordField.text!)
        }
    }
    
    @IBAction func toSignUp(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpPage", sender: nil)
    }
    func login(Username: String, Password: String) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        let predicate = NSPredicate(format: "userName = '" + Username + "' AND userPassword = '" + Password + "'")
        
        fetchRequest.predicate = predicate
        
        do {
            let allUser = try viewContext.fetch(fetchRequest)
            if !allUser.isEmpty {
                performSegue(withIdentifier: "toWelcome", sender: nil)
            }else {
                
            }
        }catch{
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWelcome" {
            let userDetail = segue.destination as! WelcomeViewController
            userDetail.userName = usernameField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.white.cgColor, UIColor.orange.cgColor]
        layer.startPoint = CGPoint(x: 1, y: 1)
        layer.endPoint = CGPoint(x: 0.5, y: 1.9)
        
        view.layer.addSublayer(layer)
        view.layer.insertSublayer(layer, at: 0)
        
        viewContext = app.persistentContainer.viewContext
        if !(UserDefaults.standard.object(forKey: "check") != nil) {
            UserDefaults.standard.setValue(0, forKey: "check")
            initializeData()
        }
        
    }


}

