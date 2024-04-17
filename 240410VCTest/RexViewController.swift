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
    
    var backButton: UIButton!
    var derLabel: UILabel!

    private lazy var createBackButton: UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = UIColor.lightGray
        backButton.titleLabel?.textColor = UIColor.black
        backButton.layer.borderColor = UIColor.darkGray.cgColor
        backButton.layer.borderWidth = 1.5
        backButton.layer.cornerRadius = 10.0
        backButton.layer.masksToBounds = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        return backButton
    }()
        
    private lazy var createDerLabel: UILabel = {
        let derLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 75))
        derLabel.text = "This is Rex's Picture!"
        derLabel.textColor = .black
        derLabel.textAlignment = .center
        return derLabel
    }()
        
    override func viewDidLoad() {
        print("RexViewController::viewDidLoad - frame = [\(view.frame)]")
        super.viewDidLoad()
        
        // Customize SubViewController1's view
        view.backgroundColor = .lightGray
        
        // Add label and button
        derLabel = createDerLabel
        backButton = createBackButton
        view.addSubview(derLabel)
        view.addSubview(backButton)
    }
    
    override func viewDidLayoutSubviews() {
        print("RexViewController::viewDidLayoutSubviews - Top - frame = [\(view.frame)]")
        super.viewDidLayoutSubviews()
        
        derLabel.center = CGPoint(x: view.frame.width/2, y: 200)

        backButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        backButton.center = CGPoint(x: view.frame.width/2, y: 300)
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        print("RexViewController - backButton Was Tapped")
        
        vcDelegate.presentMenuScreen()
    }
}
