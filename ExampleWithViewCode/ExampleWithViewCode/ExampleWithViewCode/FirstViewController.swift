//
//  FirstViewController.swift
//  ExampleWithViewCode
//
//  Created by Bruno da Luz on 1/22/17.
//  Copyright © 2017 Bruno da Luz. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let container = FirstContainer()
        container.button.addTarget(self,
                action: #selector(pressed),
                for: .touchUpInside)

        view = container
        view.backgroundColor = UIColor(red: 115.0 / 255.0, green: 200.0 / 255.0, blue: 69.0 / 255.0, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        
        view.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
    }

    func pressed() {
        guard let controller = parent as? ViewController else { return }
        controller.nextViewController()
    }
}
