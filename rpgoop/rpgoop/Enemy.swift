//
//  Enemy.swift
//  rpgoop
//
//  Created by VICTOR CHU on 2018-02-01.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return  ["Rusty Dagger", "Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}
