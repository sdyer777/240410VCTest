//
//  MenuViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/10/24.
//

import UIKit
import Foundation

class MenuViewController: UIViewController {
    var vcDelegate: ViewControllerDelegate!
    var gameButton: UIButton!
    var helpButton: UIButton!
    var hideAdsButton: UIButton!
    var rexButton: UIButton!

    private lazy var createGameButton: UIButton = {
        let gameButton = UIButton(type: .system)
        gameButton.setTitle("Play Game", for: .normal)
        gameButton.backgroundColor = UIColor.lightGray
        gameButton.titleLabel?.textColor = UIColor.black
        gameButton.layer.borderColor = UIColor.darkGray.cgColor
        gameButton.layer.borderWidth = 1.5
        gameButton.layer.cornerRadius = 10.0
        gameButton.layer.masksToBounds = true
        gameButton.translatesAutoresizingMaskIntoConstraints = false
        gameButton.addTarget(self, action: #selector(gameButtonTapped(_:)), for: .touchUpInside)
        return gameButton
    }()
        
    private lazy var createHelpButton: UIButton = {
        let helpButton = UIButton(type: .system)
        helpButton.setTitle("Help", for: .normal)
        helpButton.backgroundColor = UIColor.lightGray
        helpButton.titleLabel?.textColor = UIColor.black
        helpButton.layer.borderColor = UIColor.darkGray.cgColor
        helpButton.layer.borderWidth = 1.5
        helpButton.layer.cornerRadius = 10.0
        helpButton.layer.masksToBounds = true
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.addTarget(self, action: #selector(helpButtonTapped(_:)), for: .touchUpInside)
        return helpButton
    }()
        
    private lazy var createHideAdsButton: UIButton = {
        let hideAdsButton = UIButton(type: .system)
        hideAdsButton.setTitle("Hide Ads", for: .normal)
        hideAdsButton.backgroundColor = UIColor.lightGray
        hideAdsButton.titleLabel?.textColor = UIColor.black
        hideAdsButton.layer.borderColor = UIColor.darkGray.cgColor
        hideAdsButton.layer.borderWidth = 1.5
        hideAdsButton.layer.cornerRadius = 10.0
        hideAdsButton.layer.masksToBounds = true
        hideAdsButton.translatesAutoresizingMaskIntoConstraints = false
        hideAdsButton.addTarget(self, action: #selector(hideAdsButtonTapped(_:)), for: .touchUpInside)
        return hideAdsButton
    }()
        
    private lazy var createRexButton: UIButton = {
        let rexButton = UIButton(type: .system)
        rexButton.setTitle("Rex", for: .normal)
        rexButton.backgroundColor = UIColor.lightGray
        rexButton.titleLabel?.textColor = UIColor.black
        rexButton.layer.borderColor = UIColor.darkGray.cgColor
        rexButton.layer.borderWidth = 1.5
        rexButton.layer.cornerRadius = 10.0
        rexButton.layer.masksToBounds = true
        rexButton.translatesAutoresizingMaskIntoConstraints = false
        rexButton.addTarget(self, action: #selector(rexButtonTapped(_:)), for: .touchUpInside)
        return rexButton
    }()
        
    override func viewDidLoad() {
        print("MenuViewController::viewDidLoad - frame = [\(view.frame)]")
        super.viewDidLoad()
        
        // Customize SubViewController1's view
        view.backgroundColor = .lightGray
        
        // Add a label
        let derLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 75))
        derLabel.text = "Menu"
        derLabel.textColor = .black
        derLabel.center = CGPoint(x: view.frame.width/2, y: 200)
        derLabel.textAlignment = .center
        view.addSubview(derLabel)
        
        // Add buttons
        gameButton = createGameButton
        helpButton = createHelpButton
        hideAdsButton = createHideAdsButton
        rexButton = createRexButton

        view.addSubview(gameButton)
        view.addSubview(helpButton)
        view.addSubview(hideAdsButton)
        view.addSubview(rexButton)
    }
    
    override func viewDidLayoutSubviews() {
        print("MenuViewController::viewDidLayoutSubviews - top - view.frame = [\(view.frame)]")
        print("MenuViewController::viewDidLayoutSubviews - top - children = [\(self.children)]")
        super.viewDidLayoutSubviews()
        
        gameButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        gameButton.center = CGPoint(x: view.frame.width/2, y: 300)
        
        helpButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        helpButton.center = CGPoint(x: view.frame.width/2, y: 375)

        hideAdsButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        hideAdsButton.center = CGPoint(x: view.frame.width/2, y: 450)

        rexButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        rexButton.center = CGPoint(x: view.frame.width/2, y: 525)
    }

    @objc func gameButtonTapped(_ sender: UIButton) {
        print("MenuViewController - gameButton Was Tapped")
        vcDelegate.presentGameScreen()
    }
    
    @objc func helpButtonTapped(_ sender: UIButton) {
        print("MenuViewController - helpButton Was Tapped")
        
        vcDelegate.presentHelpScreen()
    }
    
    @objc func hideAdsButtonTapped(_ sender: UIButton) {
        print("MenuViewController - hideAdsButton Was Tapped")
    }
    
    @objc func rexButtonTapped(_ sender: UIButton) {
        print("MenuViewController - rexButton Was Tapped")
        vcDelegate.presentRexScreen()
    }
}

