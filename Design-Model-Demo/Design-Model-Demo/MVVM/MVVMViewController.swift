//
//  MVVMViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

import UIKit

class MVVMViewController: UIViewController {

    private let mvvmView: MVVMView = MVVMView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MVVM"
        let person: MVVMModel = MVVMModel(name: "Toby", age: 18)
        let viewModel = MVVMViewModel(mvvmModel: person)
        view.addSubview(mvvmView)
        mvvmView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mvvmView.mvvmModel = viewModel
        mvvmView.displayPerson()
    }

}
