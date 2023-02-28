//
//  TitleView.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 28.02.2023.
//

import UIKit

class TitleView: UIScrollView {

    //MARK: - Properties
    private var buttons:[UIButton] = []
    
    var titleDataSource: TitleDataSource? {
        didSet {
            setupUI()
        }
    }
    
    private let bottomLine = TitleViewBottomLine()
    
    private let width = FrameSize.width.size

    private var buttonX = FramePosition.buttonX.position
    private let buttonY = FramePosition.buttonY.position
    private let buttonHeight = FrameSize.buttonHeight.size
    
    private var bottomLineX = FramePosition.bottomLineX.position
    private var bottomLineY = FramePosition.bottomLineY.position
    private let bottomLineHeight = FrameSize.bottomLineHeight.size
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - SetupUI
    
    private func setupUI() {
        setupButtons()
        setupBottomLine()
    }
    
    private func setupButtons() {
        let count = titleDataSource?.titleCount(self) ?? 0
        for i in 1...count {
            if let button = titleDataSource?.buttonForTitleView(self, indexPath: IndexPath(row: i, section: 0)) {
                buttons.append(button)
                button.frame = CGRect(x: buttonX, y: buttonY, width: width, height: buttonHeight)
                buttonX = button.frame.maxX + FramePosition.offsetX
                self.addSubview(button)
            }
        }
        
        let contentWidth = buttons.last?.frame.maxX ?? 0
        let contentHeight = buttons.last?.frame.height ?? 0
        self.contentSize = CGSize(width: contentWidth, height: contentHeight)
        
        bottomLineY = (buttons.last?.frame.maxY)! + 10

    }
    
    private func setupBottomLine() {
        self.addSubview(bottomLine)
        
        bottomLine.frame = CGRect(x: bottomLineX, y: bottomLineY, width: width, height: bottomLineHeight)
    }
    
}

extension TitleView: TitleDelegate {
    func passNewFrame(x: CGFloat) {
        bottomLineX = x
        bottomLine.frame = CGRect(x: bottomLineX, y: bottomLineY, width: width, height: bottomLineHeight)
    }
    
    
}
