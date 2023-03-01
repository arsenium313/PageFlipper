//
//  TitleView.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 28.02.2023.
//

import UIKit

class TitleView: UIScrollView {

    //MARK: - Properties
    private var buttons: [UIButton] = []
    private var selectedButtonIndex: Int = 0
    
    var titleDataSource: TitleDataSource? {
        didSet {
            setupUI()
        }
    }
    
    private let bottomLine = TitleViewBottomLine()
    private var frameConfig = TitleFrameConfig()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
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
                button.frame = CGRect(x: frameConfig.buttonX,
                                      y: frameConfig.buttonY,
                                      width: frameConfig.width,
                                      height: frameConfig.buttonHeight)
                frameConfig.buttonX = button.frame.maxX + frameConfig.offsetX
                self.addSubview(button)
            }
        }
        
        let contentWidth = buttons.last?.frame.maxX ?? 0
        let contentHeight = buttons.last?.frame.height ?? 0
        self.contentSize = CGSize(width: contentWidth, height: contentHeight)
        
        frameConfig.bottomLineY = (buttons.last?.frame.maxY)! + 10
    }
    
    private func setupBottomLine() {
        self.addSubview(bottomLine)
        
        bottomLine.frame = CGRect(x: frameConfig.bottomLineX,
                                  y: frameConfig.bottomLineY,
                                  width: frameConfig.width,
                                  height: frameConfig.bottomLineHeight)
    }
    
    
    private func apdeitButtonFrame(_ index: Int) {
        // скролим центр нажатой кнопки к центру вью
        let button = buttons[index]
        let titleViewMidX = self.frame.midX
        let selectedButtonMidX = button.frame.midX
        let xLimitator = titleViewMidX + selectedButtonMidX // если больше чем contentSize.width, то вытягивает за пределы contentSize
        
        var offsetX: CGFloat {
            get {
                var offset: CGFloat = 0
                if selectedButtonMidX > titleViewMidX && xLimitator < contentSize.width {
                    offset = selectedButtonMidX - titleViewMidX
                } else if selectedButtonMidX > titleViewMidX
                            && xLimitator > contentSize.width
                            && contentSize.width > self.frame.width {
                    offset = contentSize.width - self.frame.width
                }
                return offset
            }
        }
        self.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    func apdeitBottomLineFrame(_ index: Int) {
        let button = buttons[index]
        
        frameConfig.bottomLineX = button.frame.minX
        bottomLine.frame = CGRect(x: frameConfig.bottomLineX,
                                  y: frameConfig.bottomLineY,
                                  width: frameConfig.width,
                                  height: frameConfig.bottomLineHeight)
        
        
    }
    
    
    
}


//MARK: - Title Delegate
extension TitleView: ButtonDelegate {
    func didSelectButton(_ button: UIButton) {
        // Двигаем bottomLine к нажатой кнопке
        //TODO: анимировать

        
        // найти нажатую кнопку в массиве всех кнопок(индекс)
        for (i, but) in buttons.enumerated() {
            if but == button {
                selectedButtonIndex = i
            }
        }
        
        apdeitButtonFrame(selectedButtonIndex)
        apdeitBottomLineFrame(selectedButtonIndex)
        
    }
}

//MARK: - PageDelegate
extension TitleView: PageDelegate {
    
    func selectedPage(_ vc: UIViewController, index: Int) {

        apdeitButtonFrame(index)
        apdeitBottomLineFrame(index)
    }
    
}
