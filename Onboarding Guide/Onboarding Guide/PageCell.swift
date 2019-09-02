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
            
            let color = UIColor(white: 0.2, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
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
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(textView)
        
        addConstraintsWithFormat(format: "V:|[v0]", views: imageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        
        addConstraintsWithFormat(format: "V:[v0(250)]|", views: textView)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: textView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
