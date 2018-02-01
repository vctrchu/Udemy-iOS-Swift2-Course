//
//  ViewController.swift
//  Mulitples
//
//  Created by VICTOR CHU on 2018-01-30.
//  Copyright © 2018 Victor Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var total = 0
    var amount = 0
    
    //First Screen
    @IBOutlet weak var multiplesTitle: UIImageView!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var txtField: UITextField!
    
    //Second Screen
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    //Hides all home screen contents and unhides next screen contents
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        if txtField.text != nil && txtField.text != "" {
            multiplesTitle.isHidden = true
            play.isHidden = true
            txtField.isHidden = true
            
            addLabel.isHidden = false
            addButton.isHidden = false
            
            amount = Int(txtField.text!)!
            updateLabel()
            
        }
    }
    
    //Updates label everytime add button is pressed
    @IBAction func addButtonPressed(_ sender: UIButton) {
        updateLabel()
    }
    
    //Brings user back to screen where they can enter a new textfield
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        multiplesTitle.isHidden = false
        play.isHidden = false
        txtField.isHidden = false
        
        addLabel.isHidden = true
        addButton.isHidden = true
        
        total = 0
    }
    
    //Called everytime the the label needs to be updated to new inputs
    func updateLabel() {
        addLabel.text = ("\(total) + \(amount) = \(total + amount)")
        total = total + amount
    }
    
}

