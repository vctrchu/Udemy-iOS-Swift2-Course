//
//  DevilWizard.swift
//  rpgoop
//
//  Created by VICTOR CHU on 2018-02-01.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import Foundation


class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}
