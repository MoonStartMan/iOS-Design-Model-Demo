//
//  CommandViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/6.
//

import UIKit

class CommandViewController: UIViewController {
    
    private let tv = TV()
    private let button = UIButton()
    private var remoteControl: RemoteControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        button.setTitle("Turn On TV", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        remoteControl = RemoteControl(button: button)
        remoteControl.setCommand(TVOnCommand(tv: tv))
    }
    
}

protocol Command {
    func execute()
}

class TV {
    func turnOn() {
        print("TV is turned on")
    }
    
    func turnOff() {
        print("TV is turned off")
    }
}

class TVOnCommand: Command {
    private let tv: TV
    
    init(tv: TV) {
        self.tv = tv
    }
    
    func execute() {
        tv.turnOn()
    }
}

class TVOffCommand: Command {
    private let tv: TV
    
    init(tv: TV) {
        self.tv = tv
    }
    
    func execute() {
        tv.turnOff()
    }
}

class RemoteControl {
    private var button: UIButton
    private var command: Command?
    
    init(button: UIButton) {
        self.button = button
        self.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setCommand(_ command: Command) {
        self.command = command
    }
    
    @objc private func buttonTapped() {
        command?.execute()
    }
}
