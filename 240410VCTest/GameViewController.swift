//
//  GameViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/15/24.
//

import Foundation
import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var vcDelegate: ViewControllerDelegate!
    var skView: SKView!

    private lazy var backButton: UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setTitle("Menu", for: .normal)
        backButton.backgroundColor = UIColor.lightGray
        backButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        backButton.layer.borderColor = UIColor.darkGray.cgColor
        backButton.layer.borderWidth = 1.5
        backButton.layer.cornerRadius = 10.0
        backButton.layer.masksToBounds = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        backButton.center = CGPoint(x: view.frame.width/2, y: 300)
        return backButton
    }()
        
    override func viewDidLoad() {
        print("GameViewController::viewDidLoad - frame = [\(view.frame)]")
        super.viewDidLoad()
        
        // Customize SubViewController1's view
        view.backgroundColor = .blue
        
        // Add a label
        let topLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 75))
        topLabel.text = "Top Center"
        topLabel.textColor = .black
        topLabel.center = CGPoint(x: view.frame.width/2, y: 0)
        topLabel.textAlignment = .center
        view.addSubview(topLabel)
        
        // Add a label
        let derLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 75))
        derLabel.text = "This is the game!"
        derLabel.textColor = .black
        derLabel.center = CGPoint(x: view.frame.width/2, y: 200)
        derLabel.textAlignment = .center
        view.addSubview(derLabel)
        
        // Add buttons
        view.addSubview(backButton)
        
//        super.viewDidLoad()
        
        print("GameViewController - view.frame = [\(view.frame)], view.frame.size = [\(view.frame.size)]")
        skView = SKView(frame: view.frame)
//        let skView = self.view as SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        skView.ignoresSiblingOrder = true

        let scene = GameScene(size: skView.bounds.size)
        scene.vcDelegate = vcDelegate
        skView.presentScene(scene)
        scene.scaleMode = .aspectFill
        view.addSubview(skView)

 
    }
    
    override func viewDidLayoutSubviews() {
        print("GameViewController::viewDidLayoutSubviews - top - view.frame = [\(view.frame)]")
        super.viewDidLayoutSubviews()
        
        skView.frame = view.frame
    }

    @objc func menuButtonTapped(_ sender: UIButton) {
        print("GameViewController - menuButton Was Tapped")
        
        vcDelegate.presentMenuScreen(doReveal: true)
    }
}
