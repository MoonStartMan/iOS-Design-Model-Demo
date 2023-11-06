//
//  StrategyViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/6.
//

import UIKit

class StrategyViewController: UIViewController {

    private let calculator = Calculator(strategy: AdditionStrategy())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let num1 = 10
        let num2 = 5
        
        let result = calculator.calculate(num1, num2)
        print("Result: \(result)")
        
        calculator.setStrategy(SubtractionStrategy())
        let result2 = calculator.calculate(num1, num2)
        print("Result 2: \(result2)")
        
        calculator.setStrategy(MultiplicationStrategy())
        let result3 = calculator.calculate(num1, num2)
        print("Result 3: \(result3)")
    }

}

protocol CalculationStrategy {
    func calculate(_ num1: Int, _ num2: Int) -> Int
}

class Calculator {
    private var strategy: CalculationStrategy
    
    init(strategy: CalculationStrategy) {
        self.strategy = strategy
    }
    
    func setStrategy(_ strategry: CalculationStrategy) {
        self.strategy = strategry
    }
    
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return strategy.calculate(num1, num2)
    }
}

class AdditionStrategy: CalculationStrategy {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
    }
}

class SubtractionStrategy: CalculationStrategy {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }
}

class MultiplicationStrategy: CalculationStrategy {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }
}
