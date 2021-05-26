//
//  LogInViewController.swift
//  Navigation
//
//  Created by А Сафарян on 30.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let loginScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let loginView: UIView = {
        let loginView = UIView()
        loginView.toAutoLayout()
        return loginView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.tintColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.autocapitalizationType = .none
        textField.toAutoLayout()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Email or phone"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.tintColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.toAutoLayout()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Password"
        textField.leftViewMode = .always
        return textField
    }()
    
    private let viewEmailAndPassword: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    
    
    private let loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        let image: UIImage = #imageLiteral(resourceName: "logo")
        imageView.image = image
        return imageView
    } ()
    
    private let butonLoginEnter: UIButton = {
        let button = UIButton(type: .system)
        button.toAutoLayout()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for:.normal)
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 4
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(ProfileViewController(), action: #selector(buttonPressed), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.navigationController?.navigationBar.isHidden = true

    }

    // MARK: Keyboard notifications
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Keyboard Actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            loginScrollView.contentInset.bottom = keyboardSize.height
            loginScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        loginScrollView.contentInset.bottom = .zero
        loginScrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    func setup () {
        view.addSubview(loginScrollView)
        loginScrollView.addSubview(loginView)
        loginView.addSubview(loginImageView)
        loginView.addSubview(viewEmailAndPassword)
        loginView.addSubview(butonLoginEnter)
        viewEmailAndPassword.addSubview(emailTextField)
        viewEmailAndPassword.addSubview(passwordTextField)
        
        let constraints = [
            loginScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            loginScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            loginView.topAnchor.constraint(equalTo: loginScrollView.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: loginScrollView.bottomAnchor),
            loginView.leftAnchor.constraint(equalTo: loginScrollView.leftAnchor),
            loginView.rightAnchor.constraint(equalTo: loginScrollView.rightAnchor),
            loginView.widthAnchor.constraint(equalTo: loginScrollView.widthAnchor),
            
            loginImageView.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 120),
            loginImageView.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            
            viewEmailAndPassword.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: 120),
            viewEmailAndPassword.leftAnchor.constraint(equalTo: loginView.leftAnchor, constant: 16),
            viewEmailAndPassword.rightAnchor.constraint(equalTo: loginView.rightAnchor, constant: -16),
            viewEmailAndPassword.heightAnchor.constraint(equalToConstant: 100),
            
            emailTextField.leftAnchor.constraint(equalTo: viewEmailAndPassword.leftAnchor),
            emailTextField.rightAnchor.constraint(equalTo: viewEmailAndPassword.rightAnchor),
            emailTextField.topAnchor.constraint(equalTo: viewEmailAndPassword.topAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leftAnchor.constraint(equalTo: viewEmailAndPassword.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: viewEmailAndPassword.rightAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            butonLoginEnter.topAnchor.constraint(equalTo: viewEmailAndPassword.bottomAnchor, constant: 16),
            butonLoginEnter.leftAnchor.constraint(equalTo: viewEmailAndPassword.leftAnchor),
            butonLoginEnter.rightAnchor.constraint(equalTo: viewEmailAndPassword.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    @objc private func buttonPressed() {
        let newController = ProfileViewController()
        self.navigationController?.pushViewController(newController, animated: true)
    }
    

  

}

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
