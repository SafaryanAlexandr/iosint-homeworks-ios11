//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    @IBOutlet weak var feedButtonStack: UIStackView!
    @IBOutlet weak var firstButton: UIButton! {
        didSet {
            firstButton.backgroundColor = .blue
            firstButton.setTitle("Сlick to go to the next page", for: .normal)
            firstButton.setTitleColor(.white, for:.normal)
            firstButton.layer.cornerRadius = 4
            firstButton.layer.shadowRadius = 4
            firstButton.layer.shadowColor = UIColor.black.cgColor
            firstButton.layer.shadowOffset = .init(width: 4, height: 4)
            firstButton.layer.shadowOpacity = 0.7
        }
    }
    @IBOutlet weak var secondButton: UIButton! {
        didSet {
            secondButton.backgroundColor = .white
            secondButton.setTitle("Сlick here", for: .normal)
            secondButton.setTitleColor(.blue, for:.normal)
            secondButton.layer.cornerRadius = 4
            secondButton.layer.shadowRadius = 4
            secondButton.layer.shadowColor = UIColor.black.cgColor
            secondButton.layer.shadowOffset = .init(width: 4, height: 4)
            secondButton.layer.shadowOpacity = 0.7
        }
    }
    
    let post: Post = Post(title: "Пост")
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(type(of: self), #function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(type(of: self), #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        feedButtonStack.translatesAutoresizingMaskIntoConstraints = false
        feedButtonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        feedButtonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "post" else {
            return
        }
        guard let postViewController = segue.destination as? PostViewController else {
            return
        }
        postViewController.post = post
    }
}
