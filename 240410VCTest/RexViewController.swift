//
//  RexViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/15/24.
//

import Foundation
import UIKit

class RexViewController: UIViewController {
    var vcDelegate: ViewControllerDelegate!

    private lazy var backButton: UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = UIColor.lightGray
        backButton.titleLabel?.textColor = UIColor.black
        // Customize your button here
//        derButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        backButton.layer.borderColor = UIColor.darkGray.cgColor
        backButton.layer.borderWidth = 1.5
        backButton.layer.cornerRadius = 10.0
        backButton.layer.masksToBounds = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        backButton.center = CGPoint(x: view.frame.width/2, y: 300)
        return backButton
    }()
        
    override func viewDidLoad() {
        print("RexViewController::viewDidLoad - frame = [\(view.frame)]")
        super.viewDidLoad()
        
        // Customize SubViewController1's view
        view.backgroundColor = .lightGray
        
        // Add a label
        let derLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 75))
        derLabel.text = "This is Rex's Picture!"
        derLabel.textColor = .black
        derLabel.center = CGPoint(x: view.frame.width/2, y: 200)
        derLabel.textAlignment = .center
        view.addSubview(derLabel)
        
        // Add buttons
        view.addSubview(backButton)
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        print("RexViewController - backButton Was Tapped")
        
        vcDelegate.presentMenuScreen()
    }
}
