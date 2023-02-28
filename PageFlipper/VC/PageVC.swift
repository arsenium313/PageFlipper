//
//  PageVC.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 23.01.2023.
//

import UIKit

class PageVC: UIPageViewController {
    
    //MARK: Properties
    var pageDataSource: PageDataSource? {
        didSet {
            setupUI()
        }
    }
    
    private var abstractVCs: [UIViewController] = []
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
    }

    //MARK: - SetupUI
    private func setupUI() {
        abstractVCCreate()
        setViewControllers([abstractVCs[0]], direction: .forward, animated: true)
    }
    
    private func abstractVCCreate() {
        let pageCount = pageDataSource?.pageCount(self)
        
        for i in 1...pageCount! {
            guard let vc: AbstractVC = pageDataSource?.vcToPresent(self) else { return }
            vc.labelText = "Page number = \(i)"
            abstractVCs.append(vc)
        }
    }

}


//MARK: - Data Source
extension PageVC: UIPageViewControllerDataSource {
    // только методика показа контроллеров, создаются они в другом месте
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = abstractVCs.firstIndex(of: viewController) {
            if index > 0 {
                return abstractVCs[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = abstractVCs.firstIndex(of: viewController) {
            if index < abstractVCs.count - 1 {
                return abstractVCs[index + 1]
            }
        }
        return nil
    }
    
}
