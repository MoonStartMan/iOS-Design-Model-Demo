//
//  DelegateViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

import UIKit

class DelegateViewController: UIViewController {
    
    var alertViewController: UIAlertController?
    
    weak var delegeate: DemoDelegate?
    
    private let coverView: UIView = UIView()
    
    private let nameLabel: UILabel = UILabel()
    
    private let ageLabel: UILabel = UILabel()
    
    var _name: String? {
        didSet {
            if let name = self._name {
                nameLabel.text = name
            }
        }
    }
    
    var _age: String? {
        didSet {
            if let age = self._age {
                ageLabel.text = age
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(coverView)
        coverView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
        coverView.layer.cornerRadius = 20
        coverView.layer.masksToBounds = true
        coverView.backgroundColor = .black
        
        coverView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.centerX.equalToSuperview()
        }
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
        
        coverView.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        ageLabel.textColor = .white
        ageLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
        
        self.delegeate = self
        
        setupAlertViewController()
    }
    
    func setupAlertViewController() {
        alertViewController = UIAlertController(title: "Input Message", message: "Input your age and name", preferredStyle: .alert)
        
        alertViewController?.addTextField(configurationHandler: { textField in
            textField.placeholder = "Name"
        })
        
        alertViewController?.addTextField(configurationHandler: { textField in
            textField.placeholder = "Age"
        })
        
        let confirmAction = UIAlertAction(title: "Submit", style: .default) { _ in
            /// 获取输入的姓名和年龄
            if let name = self.alertViewController?.textFields?[0].text,
               let age = self.alertViewController?.textFields?[1].text {
                self.delegeate?.name = name
                self.delegeate?.age = age
            }
        }
        alertViewController?.addAction(confirmAction)
        guard let alertViewController = alertViewController else { return }
        self.present(alertViewController, animated: false)
    }
}

extension DelegateViewController: DemoDelegate {
    var name: String? {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var age: String? {
        get {
            return _age
        }
        set {
            _age = newValue
        }
    }
}
