//
//  MVCViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

import UIKit

class MVCViewController: UIViewController {
    
    private let mvcView: MVCView = MVCView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MVC"
        let person: MVCModel = MVCModel(name: "Toby", age: 18)
        view.addSubview(mvcView)
        mvcView.displayPerson(person)
        mvcView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
