//
//  HelpPageViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/12/24.
//

import UIKit


class HelpPageViewController:  BasePageViewController  {
    var vcDelegate: ViewControllerDelegate!

    override func viewDidLoad()  {
        print("HelpPageViewController::viewDidLoad - Top")
        pageTitleText = "Themes"
        super.viewDidLoad()

        // Add a view controller (i.e. a page) for each theme
        for i in 1...4 {
            addHelpViewController(pageNumber: i)
        }
    }
    
    override func viewDidLayoutSubviews() {
        print("HelpPageViewController::viewDidLayoutSubviews - top - view.frame = [\(view.frame)]")
        print("HelpPageViewController::viewDidLayoutSubviews - top - children = [\(self.children)]")
        super.viewDidLayoutSubviews()
//        displayFirstPage()
    }

    func addHelpViewController(pageNumber: Int) {
        print("HelpPageViewController::addHelpViewController - top - pageNumber = [\(pageNumber)]")
        let vc = UIViewController()
        
        let view = HelpView(frame: view.frame, page: pageNumber)
//        view.sceneManagerDelegate = sceneManagerDelegate
        vc.view.addSubview(view)
        
        VCArr.append(vc)
        print("HelpPageViewController::addHelpViewController - end - added VC = [\(vc)]")
    }
}
