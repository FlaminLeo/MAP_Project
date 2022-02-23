//
//  Inventory.swift
//  17_EdmundTan_Project
//
//  Created by CCIAD3 on 22/2/22.
//  Copyright © 2022 ITE. All rights reserved.
//

import UIKit
func initializeData() {
    
    addCategory(Name: "CPU", ID: 1, Desc: "The CPU is the brain of a computer, containing all the circuitry needed to process input, store data, and output results", Img: "cpu_category")
    
    addCategory(Name: "GPU", ID: 2, Desc: "The CPU is the brain of a computer, containing all the circuitry needed to process input, store data, and output results", Img: "gpu_category")
    
    addCategory(Name: "Motherboard", ID: 3, Desc: "The CPU is the brain of a computer, containing all the circuitry needed to process input, store data, and output results", Img: "motherboard_category")
    
    addCategory(Name: "Memory", ID: 4, Desc: "The CPU is the brain of a computer, containing all the circuitry needed to process input, store data, and output results", Img: "memory_category")

    addCategory(Name: "Storage", ID: 5, Desc: "The CPU is the brain of a computer, containing all the circuitry needed to process input, store data, and output results", Img: "storage_category")
    
    addProduct(Name: "AMD Ryzen 5 5600X 3.7 GHz Six-Core AM4 Processor", ID: 1, CatID: 1, Desc: "Power up your computing experience with the AMD Ryzen 5 5600X 3.7 GHz Six-Core AM4 Processor, which features six cores and 12 threads to help quickly load and multitask demanding applications. Designed for socket AM4 motherboards using the powerful Zen 3 architecture, the 7nm 5th generation Ryzen processor offers significantly improved performance compared to its predecessor. With a base clock speed of 3.7 GHz and a max boost clock speed of 4.6 GHz in addition to 32MB of L3 Cache, the Ryzen 5 5600X is built to deliver the performance needed to smoothly handle tasks ranging from content creation to immersive gaming experiences. Other features include support for PCIe Gen 4 technology and 3200 MHz DDR4 RAM with compatible motherboards. This processor has a 65W TDP (Thermal Design Power) and includes a Wraith Stealth cooling solution. Please note that it does not have an integrated GPU, so a dedicated graphics card is required.", Img: "AMD Ryzen 5 5600X", Price: 200)
}
