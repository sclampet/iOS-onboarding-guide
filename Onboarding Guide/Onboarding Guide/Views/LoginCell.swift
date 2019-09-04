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
    
    let emailTextField: LeftPaddedTextField = {
       let tf = LeftPaddedTextField()
        tf.placeholder = "Email"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let tf = LeftPaddedTextField()
        tf.placeholder = "Password"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func setupViews() {
        addSubview(wave)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        addConstraintsWithFormat(format: "V:|-190-[v0(50)]-22-[v1(50)]-22-[v2(50)]", views: emailTextField, passwordTextField, loginButton)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: wave)
        addConstraintsWithFormat(format: "H:|[v0]|", views: wave)
        
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: emailTextField)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: passwordTextField)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: loginButton)
    }
    
}


class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
