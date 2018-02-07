//
//  ViewController.swift
//  mylittlemonster
//
//  Created by VICTOR CHU on 2018-02-02.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var foodImg: DragImg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        NotificationCenter.default.addObserver(self, selector: Selector("itemDroppedOnCharacter:"), name: NSNotification.Name(rawValue: "onTargetDropped"), object: nil)
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        
        print("item dropped")
        
    }



}

