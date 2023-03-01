//
//  TitleViewButton.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 28.02.2023.
//

import UIKit

class TitleViewButton: UIButton {
    
    //MARK: Properties
    var delegate: ButtonDelegate?
    

    //MARK: Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - Setup
    func setupUI() {
        self.backgroundColor = #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        setTitleColor(.red, for: .highlighted)
        self.addTarget(self, action: #selector(didPress(_:)), for: .touchUpInside)
    }
   
    
    //MARK: - @objc
    @objc
    func didPress(_ sender: UIButton) {
        delegate?.didSelectButton(self)
        // здесь будет реализация перехода на другой VC в PageVC
    }
    
}


