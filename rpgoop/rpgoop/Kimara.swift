//
//  Kimara.swift
//  rpgoop
//
//  Created by VICTOR CHU on 2018-02-01.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr: attackPwr)
        } else {
            return false
        }
    }
}
