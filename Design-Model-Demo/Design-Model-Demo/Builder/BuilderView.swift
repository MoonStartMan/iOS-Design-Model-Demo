//
//  BuilderView.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/5.
//

import UIKit

class BuilderView: UIView {
    
    private let label: UILabel = UILabel()
    
    private let button: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(label)
        addSubview(button)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
    }
    
    /// 设置标签的文本
    func setLabelText(_ text: String) {
        label.text = text
    }
    
    /// 设置按钮的标题和点击事件
    func setButtonTitle(_ title: String, target: Any?, action: Selector) {
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}
