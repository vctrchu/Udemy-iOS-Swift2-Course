//
//  ViewController.swift
//  rpgoop
//
//  Created by VICTOR CHU on 2018-02-01.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!

    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        playerHpLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
    }

    @IBAction func onChestTapped(_ sender: UIButton) {
        chestBtn.isHidden = true
        printLbl.text = chestMessage
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    @IBAction func attackTapped(_ sender: UIButton) {
        if enemy.attemptAttack(attackPwr: player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.isHidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.isHidden = true
        }
    }
    
}

