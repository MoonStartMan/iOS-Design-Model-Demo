//
//  BuilderViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/5.
//

import UIKit

class BuilderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let buildView = Builder()
            .setLabelText("Hello World")
            .setButtonTitle("Click Me", target: self, action: #selector(buttonTapped))
            .build()
        
        view.addSubview(buildView)
        buildView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    
    @objc func buttonTapped() {
        print("Button tapped")
    }

}
