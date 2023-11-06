//
//  Builder.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/5.
//

import UIKit

class Builder {
    private let builderView: BuilderView
    
    init() {
        builderView = BuilderView()
    }
    
    func setLabelText(_ text: String) -> Builder {
        builderView.setLabelText(text)
        return self
    }
    
    func setButtonTitle(_ title: String, target: Any?, action: Selector) -> Builder {
        builderView.setButtonTitle(title, target: target, action: action)
        return self
    }
    
    func build() -> BuilderView {
        return builderView
    }
}
