//
//  MenuViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/10/24.
//

import UIKit
import Foundation

class StartPageViewController: UIViewController {
    var vcDelegate: ViewControllerDelegate!
    
    private lazy var derButton: UIButton = {
        let derButton = UIButton(type: .system)
        derButton.setTitle("Play", for: .normal)
        derButton.backgroundColor = UIColor.lightGray
        derButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        derButton.layer.borderColor = UIColor.darkGray.cgColor
        derButton.layer.borderWidth = 1.5
        derButton.layer.cornerRadius = 10.0
        derButton.layer.masksToBounds = true
        derButton.translatesAutoresizingMaskIntoConstraints = false
        derButton.addTarget(self, action: #selector(derButtonTapped(_:)), for: .touchUpInside)
        derButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        derButton.center = CGPoint(x: view.frame.width/2, y: 300)
        return derButton
    }()
        
    private lazy var menuButton: UIButton = {
        let menuButton = UIButton(type: .system)
        menuButton.setTitle("Menu", for: .normal)
        menuButton.backgroundColor = UIColor.lightGray
        menuButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        menuButton.layer.borderColor = UIColor.darkGray.cgColor
        menuButton.layer.borderWidth = 1.5
        menuButton.layer.cornerRadius = 10.0
        menuButton.layer.masksToBounds = true
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        menuButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        menuButton.center = CGPoint(x: view.frame.width/2, y: 400)
        return menuButton
    }()
        
    override func viewDidLoad() {
        print("StartPageViewController::viewDidLoad - top - view.frame = [\(view.frame)]")
        super.viewDidLoad()
        
        // Customize view
        view.backgroundColor = .lightGray
        
        // Add a label
        let derLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 75))
        derLabel.text = "Start Page"
        derLabel.textColor = .black
        derLabel.center = CGPoint(x: view.frame.width/2, y: 200)
        derLabel.textAlignment = .center
        view.addSubview(derLabel)
        
        // Add a button
        view.addSubview(derButton)
        
        // Add a button
        view.addSubview(menuButton)
        print("StartPageViewController::viewDidLoad - end - view.frame = [\(view.frame)]")
    }

    override func viewDidLayoutSubviews() {
        print("StartPageViewController::viewDidLayoutSubviews - top - view.frame = [\(view.frame)]")
        print("StartPageViewController::viewDidLayoutSubviews - top - children = [\(self.children)]")
        super.viewDidLayoutSubviews()
    }

    // Button action method
    @objc func derButtonTapped(_ sender: UIButton) {
        print("StartPageViewController - derButton Was Tapped")
        // Do reveal transition to a game view
    }
    
    // Button action method
    @objc func menuButtonTapped(_ sender: UIButton) {
        print("StartPageViewController - menuButton Was Tapped")
        // Do a dissolve (or whatever) transition to Menu screen
        vcDelegate.presentMenuScreen()
    }
}

