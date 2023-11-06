//
//  MVCView.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

import UIKit

class MVCView: UIView {
    
    private let coverView: UIView = UIView()
    
    private let nameLabel: UILabel = UILabel()
    
    private let ageLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(coverView)
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
    }
    
    func displayPerson(_ person: MVCModel) {
        nameLabel.text = person.name
        ageLabel.text = "\(person.age)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
