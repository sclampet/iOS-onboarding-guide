//
//  LoginViewCell.swift
//  Onboarding Guide
//
//  Created by Scott Clampet on 9/2/19.
//  Copyright © 2019 Scott Clampet. All rights reserved.
//

import UIKit

class LoginCell: BaseCell {
    
    let logo: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let emailTextField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Email"
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
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
        addSubview(logo)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        addConstraintsWithFormat(format: "V:|-150-[v0]-40-[v1(50)]-22-[v2(50)]-22-[v3(50)]", views: logo, emailTextField, passwordTextField, loginButton)
        
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: logo)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: emailTextField)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: passwordTextField)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: loginButton)
    }
}
