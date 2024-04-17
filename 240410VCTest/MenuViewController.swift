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

    private lazy var gameButton: UIButton = {
        let gameButton = UIButton(type: .system)
        gameButton.setTitle("Play Game", for: .normal)
        gameButton.backgroundColor = UIColor.lightGray
        gameButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        gameButton.layer.borderColor = UIColor.darkGray.cgColor
        gameButton.layer.borderWidth = 1.5
        gameButton.layer.cornerRadius = 10.0
        gameButton.layer.masksToBounds = true
        gameButton.translatesAutoresizingMaskIntoConstraints = false
        gameButton.addTarget(self, action: #selector(gameButtonTapped(_:)), for: .touchUpInside)
        gameButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        gameButton.center = CGPoint(x: view.frame.width/2, y: 300)
        return gameButton
    }()
        
    private lazy var helpButton: UIButton = {
        let helpButton = UIButton(type: .system)
        helpButton.setTitle("Help", for: .normal)
        helpButton.backgroundColor = UIColor.lightGray
        helpButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        helpButton.layer.borderColor = UIColor.darkGray.cgColor
        helpButton.layer.borderWidth = 1.5
        helpButton.layer.cornerRadius = 10.0
        helpButton.layer.masksToBounds = true
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.addTarget(self, action: #selector(helpButtonTapped(_:)), for: .touchUpInside)
        helpButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        helpButton.center = CGPoint(x: view.frame.width/2, y: 375)
        return helpButton
    }()
        
    private lazy var hideAdsButton: UIButton = {
        let hideAdsButton = UIButton(type: .system)
        hideAdsButton.setTitle("Hide Ads", for: .normal)
        hideAdsButton.backgroundColor = UIColor.lightGray
        hideAdsButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        hideAdsButton.layer.borderColor = UIColor.darkGray.cgColor
        hideAdsButton.layer.borderWidth = 1.5
        hideAdsButton.layer.cornerRadius = 10.0
        hideAdsButton.layer.masksToBounds = true
        hideAdsButton.translatesAutoresizingMaskIntoConstraints = false
        hideAdsButton.addTarget(self, action: #selector(hideAdsButtonTapped(_:)), for: .touchUpInside)
        hideAdsButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        hideAdsButton.center = CGPoint(x: view.frame.width/2, y: 450)
        return hideAdsButton
    }()
        
    private lazy var rexButton: UIButton = {
        let rexButton = UIButton(type: .system)
        rexButton.setTitle("Rex", for: .normal)
        rexButton.backgroundColor = UIColor.lightGray
        rexButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        rexButton.layer.borderColor = UIColor.darkGray.cgColor
        rexButton.layer.borderWidth = 1.5
        rexButton.layer.cornerRadius = 10.0
        rexButton.layer.masksToBounds = true
        rexButton.translatesAutoresizingMaskIntoConstraints = false
        rexButton.addTarget(self, action: #selector(rexButtonTapped(_:)), for: .touchUpInside)
        rexButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        rexButton.center = CGPoint(x: view.frame.width/2, y: 525)
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
        view.addSubview(gameButton)
        view.addSubview(helpButton)
        view.addSubview(hideAdsButton)
        view.addSubview(rexButton)
    }
    
    override func viewDidLayoutSubviews() {
        print("MenuViewController::viewDidLayoutSubviews - top - view.frame = [\(view.frame)]")
        print("MenuViewController::viewDidLayoutSubviews - top - children = [\(self.children)]")
        super.viewDidLayoutSubviews()
    }

    @objc func gameButtonTapped(_ sender: UIButton) {
        print("MenuViewController - gameButton Was Tapped")
        vcDelegate.presentGameScreen()
    }
    
    @objc func helpButtonTapped(_ sender: UIButton) {
        print("MenuViewController - helpButton Was Tapped")
        
        vcDelegate.presentHelpScreen()

        
/*        let vc  = HelpPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.8)
        vc.modalTransitionStyle = .crossDissolve
//        vc.sceneManagerDelegate = self
        self.show(vc, sender: self)
*/
        
    }
    
    @objc func hideAdsButtonTapped(_ sender: UIButton) {
        print("MenuViewController - hideAdsButton Was Tapped")
    }
    
    @objc func rexButtonTapped(_ sender: UIButton) {
        print("MenuViewController - rexButton Was Tapped")
        vcDelegate.presentRexScreen()
    }
}

