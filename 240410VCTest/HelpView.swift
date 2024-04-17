//
//  HelpView.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/12/24.
//

import Foundation
import UIKit

class HelpView: UIView {
    var pageNumber: Int = 0
    
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
        derButton.center = CGPoint(x: frame.width/2, y: 225)
        return derButton
    }()
        
    // Initialize with a string parameter
    init(frame: CGRect, page: Int) {
        self.pageNumber = page
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        print("HelpView::setupView - Top")
        // Set background color
        backgroundColor = UIColor.green // Change the color as per your requirement
        
        // Theme Name
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 900, height: 100))
        label1.font = UIFont.init(name: "HelveticaNeue-thin", size: 30)
        label1.text = "Page \(pageNumber)"
        label1.textColor = .black
        label1.center = CGPoint(x: 210, y: 90)
        label1.textAlignment = .center
        addSubview(label1)
        
        addSubview(derButton)
    }
    
    // Button action method
    @objc func derButtonTapped(_ sender: UIButton) {
        print("HelpView - derButtonTapped Was Tapped")
    }
    

    
}
