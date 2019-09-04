//
//  LoginViewCell.swift
//  Onboarding Guide
//
//  Created by Scott Clampet on 9/2/19.
//  Copyright © 2019 Scott Clampet. All rights reserved.
//

import UIKit

class LoginCell: BaseCell {
    
    let wave: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "login")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "welcome"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textAlignment = .center
        return label
    }()
    
    let emailTextField: LeftPaddedTextField = {
       let tf = LeftPaddedTextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 1)])
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let tf = LeftPaddedTextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 1)])
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func setupViews() {
        addSubview(wave)
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        setupGradientLayer()
        
        addConstraintsWithFormat(format: "V:[v0(50)]-22-[v1(50)]-26-[v2(50)]-200-|", views: emailTextField, passwordTextField, loginButton)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: wave)
        addConstraintsWithFormat(format: "H:|[v0]|", views: wave)
        
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150).isActive = true
        
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: emailTextField)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: passwordTextField)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: loginButton)
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.05, 1]
        
        wave.layer.addSublayer(gradientLayer)
    }
    
}


class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
