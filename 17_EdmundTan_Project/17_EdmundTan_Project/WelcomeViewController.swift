//
//  WelcomeViewController.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 17/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var creditsLbl: UILabel!
    var userName: String = ""
    var retrievedUser:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrievedUser = retrieveWelcome(Username: userName)
        welcomeLbl.text = "Welcome to Kangaroo, \n\(retrievedUser.userName ?? "")"
        creditsLbl.text = "You have \(retrievedUser.credits) Credits"
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 2.0, execute: {
           self.performSegue(withIdentifier:"toHomePage",sender: self)
        })
                // Do any additional setup after loading the view.
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
