//
//  AbstractVC.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 07.02.2023.
//

import UIKit

class AbstractVC: UIViewController {

    //MARK: Properties
    public var labelText: String = "empty" {
        willSet {
            counterLabel.text = newValue
        }
    }
    
    private let counterView = UIView()
    private let counterLabel = UILabel()
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .randomColor
        setupUI()
    }


    //MARK: - SetupUI
    private func setupUI() {
        configureView()
        configureLabel()
    }
    
    private func configureView() {
        self.view.addSubview(counterView)
        counterView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        counterView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            counterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
            counterView.heightAnchor.constraint(equalTo: counterView.widthAnchor),
            counterView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            counterView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    private func configureLabel() {
        counterView.addSubview(counterLabel)
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            counterLabel.centerXAnchor.constraint(equalTo: counterView.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: counterView.centerYAnchor)
        ])
    }
    
}
