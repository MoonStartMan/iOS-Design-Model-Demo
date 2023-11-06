//
//  Singleton.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

class Singleton {
    static let shared = Singleton()
    
    func getName() -> String {
        return "Toby"
    }
    
    func getAge() -> Int {
        return 18
    }
}
