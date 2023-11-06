//
//  MVVMViewModel.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

class MVVMViewModel {
    
    private var mvvmModel: MVVMModel
    
    var name: String {
        return mvvmModel.name
    }
    
    var age: Int {
        return mvvmModel.age
    }
    
    init(mvvmModel: MVVMModel) {
        self.mvvmModel = mvvmModel
    }
    
}
