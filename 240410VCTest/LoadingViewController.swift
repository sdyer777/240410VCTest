//
//  LoadingViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/10/24.
//

import UIKit
import Foundation

class LoadingViewController: UIViewController {
    
    private lazy var derButton: UIButton = {
        let derButton = UIButton(type: .system)
        derButton.setTitle("Button", for: .normal)
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
        derButton.center = CGPoint(x: view.frame.width/2, y: 400)
        return derButton
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize view
        view.backgroundColor = .green
        
        print("LoadingViewController::viewDidLoad - frame = [\(view.frame)]")

        
        // Add a label
        let derLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 75))
        derLabel.text = "Loading..."
        derLabel.textColor = .black
        derLabel.center = CGPoint(x: view.frame.width/2, y: 200)
        derLabel.textAlignment = .center
        view.addSubview(derLabel)
        
        
        // Add a button
        view.addSubview(derButton)


        
        // Add any additional setup code
    }
    
    // Button action method
    @objc func derButtonTapped(_ sender: UIButton) {
        print("LoadingViewController - derButton Was Tapped")
    }

}
