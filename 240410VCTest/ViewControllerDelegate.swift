//
//  ViewControllerDelegate.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/10/24.
//

import Foundation

protocol ViewControllerDelegate {
    
    func presentStartScreen()
    func presentMenuScreen(doReveal: Bool)
    func presentGameScreen()
    func presentHelpScreen()
    func presentRexScreen()

    func showAdView()
    func removeAdView()
}

extension ViewControllerDelegate {
    // Extension adds ability to default parameters to "false"
    
    func presentMenuScreen(doReveal: Bool = false) {
        presentMenuScreen(doReveal: false)
    }
}

