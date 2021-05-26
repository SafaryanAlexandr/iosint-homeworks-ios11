//
//  ProfileViewController.swift
//  Navigation
//
//  Created by А Сафарян on 19.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let newButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for:.normal)
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(newButton)
        
        newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive
            = true
        newButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        newButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

}
