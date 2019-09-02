//
//  PageCell.swift
//  Onboarding Guide
//
//  Created by Scott Clampet on 9/2/19.
//  Copyright © 2019 Scott Clampet. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            imageView.image = UIImage(named: page.imageName)
            textView.text = page.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "mountains")
        return imageView
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = ""
        tv.isEditable = false
        return tv
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(textView)
        
        addConstraintsWithFormat(format: "V:|[v0]", views: imageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        
        addConstraintsWithFormat(format: "V:[v0(250)]|", views: textView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: textView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
