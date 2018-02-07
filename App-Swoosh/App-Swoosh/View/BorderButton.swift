//
//  BorderButton.swift
//  App-Swoosh
//
//  Created by VICTOR CHU on 2018-02-06.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
    
    

}
