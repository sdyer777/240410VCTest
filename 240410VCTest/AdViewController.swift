//
//  MenuViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/10/24.
//

import UIKit
import Foundation

class AdViewController: UIViewController {
    
    override func viewDidLoad() {
        print("AdViewController::viewDidLoad - top - view.frame = [\(view.frame)]")
        super.viewDidLoad()
        
        // Customize SubViewController1's view
        view.backgroundColor = .darkGray
        
        // Add a label
        let derLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 75))
        derLabel.text = "Advertisement"
        derLabel.textColor = .black
        derLabel.center = CGPoint(x: view.frame.width/2, y: 50)
        derLabel.textAlignment = .center
        view.addSubview(derLabel)
    }
}

