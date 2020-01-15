//
//  ViewController.swift
//  Calculator
//
//  Created by Павел Скляр on 15.01.2020.
//  Copyright © 2020 Павел Скляр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstEnter:Bool = true
    
    var prevNumber:Double = 0
    var currentNumber:Double = 0
    
    var action:Bool = false
    var actionNumber:Int = 0
    
    /* Переменная с привязкой на label с результатом */
    @IBOutlet weak var result: UILabel!
    
    /* Функция вызывается при клике на любое из чисел (0-9) */
    @IBAction func enterDigits(_ sender: UIButton) {
        if (action == true) {
            result.text = String(sender.tag)
            action = false
        }
        else {
            if (firstEnter == true) {
                firstEnter = false
                result.text = String(sender.tag)
            }
            else {
                result.text = result.text! + String(sender.tag)
            }
        }
        
        currentNumber = Double(result.text!)!
    }
    
    @IBAction func clearResult(_ sender: UIButton) {
        result.text = "0"
        firstEnter = true
    }
    
    @IBAction func actions(_ sender: UIButton) {
        prevNumber = currentNumber
        
        if (sender.tag == 11) {
            result.text = "+"
        }
        else if (sender.tag == 12) {
            result.text = "-"
        }
        else if (sender.tag == 13) {
            result.text = "x"
        }
        else if (sender.tag == 14) {
            result.text = "/"
        }
        
        actionNumber = sender.tag
        
        action = true
    }
    
    @IBAction func countResult(_ sender: UIButton) {
        if (actionNumber == 11) {
            currentNumber = prevNumber + currentNumber
            result.text = String(currentNumber)
        }
        else if (actionNumber == 12) {
            currentNumber = prevNumber - currentNumber
            result.text = String(currentNumber)
        }
        else if (actionNumber == 13) {
            currentNumber = prevNumber * currentNumber
            result.text = String(currentNumber)
        }
        else if (actionNumber == 14) {
            if (currentNumber != 0) {
                currentNumber = prevNumber / currentNumber
                result.text = String(currentNumber)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
