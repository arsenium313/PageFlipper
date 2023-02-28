//
//  TitleViewDataSource.swift
//  PageFlipper
//
//  Created by Арсений Кухарев on 28.02.2023.
//

import UIKit

protocol TitleDataSource {
    func titleCount(_ titleView: TitleView) -> Int
    func buttonForTitleView(_ titleView: TitleView, indexPath: IndexPath) -> UIButton
}
