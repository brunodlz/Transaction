//
//  ContainerViewController.swift
//  ExampleWithViewCode
//
//  Created by Bruno da Luz on 1/22/17.
//  Copyright © 2017 Bruno da Luz. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        start()
    }
    
    fileprivate func start() {
        let viewController = ViewController()
        
        viewController.view.backgroundColor   = .gray
        viewController.modalTransitionStyle   = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        
        self.navigationController?.present(viewController,
                                           animated: true,
                                           completion: nil)
    }
}
