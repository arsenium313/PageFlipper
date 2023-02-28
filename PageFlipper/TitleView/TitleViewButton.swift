//
//  TitleViewButton.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 28.02.2023.
//

import UIKit

class TitleViewButton: UIButton {
    
    var delegate: TitleDelegate?
    
    var senderX: CGFloat = 0
    
    //MARK: Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
        self.addTarget(self, action: #selector(didPress(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - Setup
    func setupUI() {
        self.backgroundColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
        setTitleColor(.red, for: .highlighted)
    }
   
    //MARK: - @objc
    @objc
    func didPress(_ sender: UIButton) {
        print("Button pressed! \(String(describing: self.titleLabel?.text))")
        print("sender frame = \(sender.frame)")
        delegate?.passNewFrame(x: sender.frame.minX)
        // нажал и пошла инфа в линию о фрейме нажатой кнопки
    }
    
}


