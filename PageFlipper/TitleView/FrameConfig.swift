//
//  ButtonConfig.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 28.02.2023.
//

import UIKit

enum FramePosition {
    
    case buttonX
    case buttonY
    case bottomLineX
    case bottomLineY

    static let offsetX: CGFloat = 10
    
    var position: CGFloat {
        switch self {
        case .buttonX: return 0
        case .buttonY: return 0
        case .bottomLineX: return 0
        case .bottomLineY: return 0
        }
    }
}

enum FrameSize {
    
    case width
    case buttonHeight
    case bottomLineHeight
    
    var size: CGFloat {
        switch self {
        case .width: return 100
        case .buttonHeight: return 60
        case .bottomLineHeight: return 10
        }
    }
}
