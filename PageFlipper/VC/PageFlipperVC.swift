//
//  ViewController.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 23.01.2023.
//

import UIKit

class PageFlipperVC: UIViewController {

    //MARK: Properties
    private let amountOfPages = 5
    
    private let viewForPageVC = UIView()
    private let titleView = TitleView()
    private let pageVC: PageVC = {
        let interPageSpacing = [UIPageViewController.OptionsKey.interPageSpacing : 30]
        let pageVC = PageVC(transitionStyle: .scroll, navigationOrientation: .horizontal, options: interPageSpacing)
        return pageVC
    }()

    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
        setupUI()
    }

    
    //MARK: - SetupUI
    private func setupUI() {
        configureViewForPageVC()
        configurePageVC()
        configureTitleView()
    }

    private func configureViewForPageVC() {
        self.view.addSubview(viewForPageVC)
        viewForPageVC.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        viewForPageVC.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewForPageVC.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            viewForPageVC.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewForPageVC.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewForPageVC.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.82),
        ])
    }
    
    private func configurePageVC() {
        pageVC.pageDataSource = self
        
        self.addChild(pageVC)
        self.viewForPageVC.addSubview(pageVC.view)
        pageVC.view.frame = viewForPageVC.bounds
        pageVC.didMove(toParent: self)
    }
    
    private func configureTitleView() {
        titleView.titleDataSource = self
        
        self.view.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleView.bottomAnchor.constraint(equalTo: viewForPageVC.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}


//MARK: - PageVCDataSource
extension PageFlipperVC: PageDataSource {

    func pageCount(_ pageVC: UIPageViewController) -> Int {
        return amountOfPages
    }
    
    func vcToPresent(_ pageVC: UIPageViewController) -> AbstractVC {
        let vc = AbstractVC()
        return vc
    }
}


//MARK: - TitleViewDataSource
extension PageFlipperVC: TitleDataSource {
    
    func titleCount(_ titleView: TitleView) -> Int {
        return amountOfPages
    }
    
    func buttonForTitleView(_ titleView: TitleView, indexPath: IndexPath) -> UIButton {
        let button = TitleViewButton()
        button.setTitle("Test title \(indexPath.row)", for: .normal)
        button.delegate = titleView
        return button
    }
}
