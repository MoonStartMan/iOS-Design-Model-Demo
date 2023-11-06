//
//  ObserverViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/3.
//

import UIKit
import SnapKit

//观察者模式的使用场景包括：

//当一个对象的状态变化需要通知其他对象时，可以使用观察者模式。例如，当用户在应用程序中进行了某些操作时，需要通知其他模块进行相应的更新。
//当一个对象需要在状态变化时执行一系列的操作，而这些操作由其他对象负责实现时，可以使用观察者模式。例如，当用户登录后，需要通知其他模块更新用户信息、显示欢迎消息等。
//当一个对象需要将自己的状态变化通知给一组对象，而不需要知道具体的观察者时，可以使用观察者模式。这样可以实现对象之间的解耦，提高代码的可维护性和可扩展性。
//总之，观察者模式是一种非常有用的设计模式，可以帮助我们实现对象之间的松耦合和动态通信。通过使用观察者模式，我们可以更好地组织和管理对象之间的关系，提高代码的可读性和可维护性。

class ObserverViewController: UIViewController {

    private let counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = CounterLabel()
        label.text = "0"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        label.textColor = .black
        counter.attach(observer: label)
        
        let incrementButton = UIButton()
        incrementButton.setTitle("加", for: .normal)
        incrementButton.addTarget(self, action: #selector(increment), for: .touchUpInside)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.borderWidth = 1.0
        incrementButton.layer.borderColor = UIColor.black.cgColor
        incrementButton.layer.cornerRadius = 10
        incrementButton.layer.masksToBounds = true
        view.addSubview(incrementButton)
        incrementButton.snp.makeConstraints { make in
            make.right.equalTo(label.snp.left).offset(-20)
            make.centerY.equalTo(label.snp.centerY)
            make.width.height.equalTo(40)
        }
        
        let decrementButton = UIButton()
        decrementButton.setTitle("减", for: .normal)
        decrementButton.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        decrementButton.setTitleColor(.black, for: .normal)
        decrementButton.layer.borderWidth = 1.0
        decrementButton.layer.borderColor = UIColor.black.cgColor
        decrementButton.layer.cornerRadius = 10
        decrementButton.layer.masksToBounds = true
        view.addSubview(decrementButton)
        decrementButton.snp.makeConstraints { make in
            make.left.equalTo(label.snp.right).offset(20)
            make.centerY.equalTo(label.snp.centerY)
            make.width.height.equalTo(40)
        }
    }
    
    @objc func increment() {
        counter.increment()
    }
    
    @objc func decrement() {
        counter.decrement()
    }

}

class CounterLabel: UILabel, CounterObserver {
    func counterDidUpdate(value: Int) {
        self.text = "\(value)"
    }
}
