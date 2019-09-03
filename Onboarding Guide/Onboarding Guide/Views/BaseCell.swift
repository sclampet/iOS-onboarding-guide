//
//  BaseCell.swift
//  Onboarding Guide
//
//  Created by Scott Clampet on 9/3/19.
//  Copyright © 2019 Scott Clampet. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
