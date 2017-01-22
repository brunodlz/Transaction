//
//  FirstContainer.swift
//  ExampleWithViewCode
//
//  Created by Bruno da Luz on 1/22/17.
//  Copyright © 2017 Bruno da Luz. All rights reserved.
//

import UIKit
import SnapKit

class FirstContainer: UIView {

    var label: UILabel = {
        let label = UILabel()
        label.text = "First"
        label.textColor = .white

        label.font = UIFont.systemFont(ofSize: 17,
                weight: UIFontWeightMedium)
        return label
    }()

    var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.titleLabel?.textColor = .white
        button.setTitle("N", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupView() {
        addSubview(label)
        addSubview(button)

        label.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }

        button.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
}
