//
//  UIButton ext.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 07.02.2023.
//

import UIKit

extension UIButton {
    
    static func customButton(title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.white, for: .focused)
        return button
    }
    
    
}
