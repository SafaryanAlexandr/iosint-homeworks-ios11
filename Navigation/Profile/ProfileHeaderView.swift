//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by А Сафарян on 21.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

   
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var setStatusButton: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    private var statusTex: String = ""
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.text = "First"
        
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .black
        statusLabel.text = "--------"
        
        setStatusButton.backgroundColor = .blue
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for:.normal)
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = .init(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.7
        
//        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
//        avatarImageView.layer.borderWidth = 3
//        avatarImageView.layer.borderColor = UIColor.white.cgColor
//        avatarImageView.contentMode = .scaleAspectFill
//        avatarImageViewclipsToBounds = true
//        let imageProfile: UIImage = #imageLiteral(resourceName: "profileImage")
//        avatarImageView.image = imageProfile
        
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.cornerRadius = 6
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged )
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

    }
    
    
    @objc private func buttonPressed() {
        print(statusTex)
        statusLabel.text = statusTex
        
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusTex = statusTextField.text ?? "------"
    }
    
    
}
 


