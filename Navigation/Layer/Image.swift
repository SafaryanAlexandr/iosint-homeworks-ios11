//
//  Image.swift
//  Navigation
//
//  Created by А Сафарян on 19.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@IBDesignable

class Image: UIImageView {
   
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
