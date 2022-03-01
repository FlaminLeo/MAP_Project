//
//  HomeViewController.swift
//  17_EdmundTan_Project
//
//  Created by Angela Loo on 28/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var user = String()
    var retrievedUser: User!
    @IBOutlet weak var creditsLbl: UILabel!
    @IBOutlet weak var imageCarousell: UIImageView!
    @IBOutlet weak var catOne: UIImageView!
    @IBOutlet weak var catTwo: UIImageView!
    @IBOutlet weak var carouselControl: UIPageControl!
    
    let carouselImg = ["banner1", "banner2", "banner3", "banner4", "banner5", ]
    var carouselCounter = Int()
    
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        
        if carouselCounter != 4 {
            if sender.direction == .left {
                carouselCounter += 1
            }else if sender.direction == .right {
                carouselCounter -= 1
            }
        }else if carouselCounter >= 4 {
            carouselCounter = 0
        }else if carouselCounter <= 0 {
            carouselCounter = 4
        }
        
        switch carouselCounter {
            
            case 0:
                imageCarousell.image = UIImage(named: carouselImg[carouselCounter])
                carouselControl.currentPage = 0
            
            case 1:
                imageCarousell.image = UIImage(named: carouselImg[carouselCounter])
                carouselControl.currentPage = 1
            
            case 2:
                imageCarousell.image = UIImage(named: carouselImg[carouselCounter])
                carouselControl.currentPage = 2
            
            case 3:
                imageCarousell.image = UIImage(named: carouselImg[carouselCounter])
                carouselControl.currentPage = 3
            
            case 4:
                imageCarousell.image = UIImage(named: carouselImg[carouselCounter])
                carouselControl.currentPage = 4
            
            
            default:
            break
        }
        
        print(sender.direction)
        print(carouselCounter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        
        view.addGestureRecognizer(leftSwipe)
        
        imageCarousell.image = UIImage(named: carouselImg[carouselCounter])
        
        retrievedUser = retrieveWelcome(Username: user)
        
        creditsLbl.text = String(retrievedUser.credits)
        
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
