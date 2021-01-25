//
//  BindingTextField.swift
//  MvvmGoodWeatherApp
//
//  Created by Burak Tunc on 25.01.21.
//  Copyright © 2021 Burak Tunç. All rights reserved.
//

import Foundation
import UIKit

// MARK: View to ViewModel Binding
class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = { _ in }
    
    // MARK: Why? Research!!
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func bind(callback: @escaping(String) -> ()) {
        self.textChangeClosure = callback
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(_ textField: UITextField){
        if let text = textField.text {
            self.textChangeClosure(text)
        }
        
    }
    
}
