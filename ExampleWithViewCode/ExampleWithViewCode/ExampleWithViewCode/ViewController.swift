//
//  ViewController.swift
//  ExampleWithViewCode
//
//  Created by Bruno da Luz on 1/22/17.
//  Copyright © 2017 Bruno da Luz. All rights reserved.
//

import UIKit
import Transaction
import SnapKit

class ViewController: UIViewController {

    let animation = Transaction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        currentViewController()
    }

    func nextViewController() {

    }

    func backViewController() {
        currentViewController()
    }

    fileprivate func currentViewController() {
        let first = FirstViewController()

        animation.startOn(current: self,
                destination: first,
                animation: .transitionFlipFromRight)

        first.view.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
    }
}
