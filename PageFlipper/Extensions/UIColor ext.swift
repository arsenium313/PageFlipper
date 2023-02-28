//
//  UIColor ext.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 07.02.2023.
//

import UIKit

extension UIColor {
    
    static var randomColor: UIColor {
        let r: CGFloat = .random(in: 0...1)
        let g: CGFloat = .random(in: 0...1)
        let b: CGFloat = .random(in: 0...1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}
