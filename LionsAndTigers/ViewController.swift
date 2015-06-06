//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Salar Ali on 2015-06-04.
//  Copyright (c) 2015 BAY50. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var randomFactLabel: UILabel!
    
    
    var myTigers:[Tiger] = []
    
    var currentIndex = 0
    
    
    
    
    //----------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: true)
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        var myTiger2 = Tiger()
        myTiger2.name = "Rex"
        myTiger2.image = UIImage(named: "IndochineseTiger.jpg")
        myTiger2.age = 4
        myTiger2.breed = "Indochinese"
        
//        println("My tiger's name is \(myTiger.name) and it's image is \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        
        myTigers += [myTiger, myTiger2]
        
        myTiger.chuffANumberOfTimes(3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------------------------------

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var randomIndex:Int
        
        do {
        
        randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        
        } while currentIndex == randomIndex
        
        currentIndex == randomIndex
        
       
        let shownTiger = myTigers[randomIndex]
//        
//        myImageView.image = shownTiger.image
//        nameLabel.text = shownTiger.name
//        ageLabel.text = "\(shownTiger.age)"
//        breedLabel.text = shownTiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = shownTiger.image
            self.nameLabel.text = shownTiger.name
            self.ageLabel.text = "\(shownTiger.age)"
            self.breedLabel.text = shownTiger.breed
            self.randomFactLabel.text = shownTiger.randomFact()
            
            }, completion: {
                
                (finished: Bool) -> () in
        })
        
        
        
    
    }

}

