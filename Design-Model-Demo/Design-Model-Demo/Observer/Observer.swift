//
//  Observer.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/3.
//

protocol CounterObserver: AnyObject {
    func counterDidUpdate(value: Int)
}

class Counter {
    private var value: Int = 0
    private var observers: [CounterObserver] = []
    
    func attach(observer: CounterObserver) {
        observers.append(observer)
    }
    
    func detach(observer: CounterObserver) {
        observers.removeAll { $0 === observer }
    }
    
    func increment() {
        value += 1
        notifyObservers()
    }
    
    func decrement() {
        value -= 1
        notifyObservers()
    }
    
    private func notifyObservers() {
        for observer in observers {
            observer.counterDidUpdate(value: value)
        }
    }
}
