//
//  PageVCdataSource.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 28.02.2023.
//

import UIKit

protocol PageDataSource {
    func pageCount(_ pageVC: UIPageViewController) -> Int
    func vcToPresent(_ pageVC: UIPageViewController) -> AbstractVC
}
