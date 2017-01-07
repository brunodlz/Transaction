//
//  ViewController.swift
//  ExampleWithStoryboard
//
//  Created by Bruno da Luz on 1/7/17.
//  Copyright © 2017 Bruno da Luz. All rights reserved.
//

import UIKit
import Transaction

enum Segue: String {
    case First
    case Second
}

class ViewController: UIViewController {

    let animation = Transaction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFirstSegue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.First.rawValue {
            animation.startOn(current: self, with: segue, options: .transitionFlipFromRight)
        } else if segue.identifier == Segue.Second.rawValue {
            animation.startOn(current: self, with: segue, options: .transitionFlipFromLeft)
        }
    }
    
    func showFirstSegue() {
        performSegue(withIdentifier: Segue.First.rawValue, sender: nil)
    }
    
    func showSecondSegue() {
        performSegue(withIdentifier: Segue.Second.rawValue, sender: nil)
    }
}

