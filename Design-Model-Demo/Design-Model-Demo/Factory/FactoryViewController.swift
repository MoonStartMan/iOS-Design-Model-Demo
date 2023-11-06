//
//  FactoryViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/5.
//

import UIKit
import SnapKit

class FactoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Factory"

        let roundButtonFactory = RoundButtonFactory()
        let roundButton = roundButtonFactory.createButton()
        
        roundButton.setTitle("Click Me", for: .normal)
        roundButton.setTitleColor(.black, for: .normal)
        roundButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        guard let roundButton = roundButton as? UIButton else { return }
        view.addSubview(roundButton)
        roundButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        roundButton.layer.borderColor = UIColor.black.cgColor
        roundButton.layer.borderWidth = 1.0
        roundButton.layer.cornerRadius = 10
        roundButton.layer.masksToBounds = true
        roundButton.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .bold)
    }
    
    @objc func buttonTapped() {
        print("按钮被点击了")
    }

}

protocol Button {
    func setTitle(_ title: String, for state: UIControl.State)
    func setTitleColor(_ color: UIColor?, for state: UIControl.State)
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event)
}

class RoundButton: UIButton, Button {
    func setTitle(_ title: String, for state: UIControl.State) {
        super.setTitle(title, for: .normal)
    }
    
    override func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        super.setTitleColor(color, for: state)
    }
    
    override func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        super.addTarget(target, action: action, for: event)
    }
}

class SquareButton: UIButton, Button {
    func setTitle(_ title: String, for state: UIControl.State) {
        super.setTitle(title, for: .normal)
    }
    
    override func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        super.setTitleColor(color, for: state)
    }
    
    override func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        super.addTarget(target, action: action, for: event)
    }
}

protocol ButtonFactory {
    func createButton() -> Button
}

class RoundButtonFactory: ButtonFactory {
    func createButton() -> Button {
        return RoundButton()
    }
}

class SquareButtonFactory: ButtonFactory {
    func createButton() -> Button {
        return SquareButton()
    }
}
