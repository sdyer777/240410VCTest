//
//  BasePageViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/12/24.
//

import Foundation
import UIKit


class BasePageViewController:  UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate  {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var vcDelegate: ViewControllerDelegate!

    var pages = [UIViewController]()
    let pageControl = UIPageControl() // external - not part of underlying pages
    let initialPage = 0
    
    var rexxleTitle: UILabel!
    var pageTitle: UILabel!
    var pageTitleText: String = ""
    var VCArr: [UIViewController] = []
    
    var backButton: UIButton!

    private lazy var createBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        // Customize your button here
        button.titleLabel?.font = UIFont.init(name: "HelveticaNeue-thin", size: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.frame.size.width = 400
        button.center = CGPoint(x: view.frame.width/2, y: view.frame.height - 100)
        return button
    }()
    
    override func viewDidLoad()  {
        print("BasePageViewController::viewDidLoad - Top")
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        // Rexxle title, does not move with pages.
        rexxleTitle = UILabel(frame: CGRect(x: 0, y: 60, width: 300, height: 80))
        rexxleTitle.text = "VCTest"
        rexxleTitle.font = UIFont.init(name: "HelveticaNeue-ultralight", size: 60)
        rexxleTitle.textColor = UIColor.blue
        rexxleTitle.textAlignment = .center
        view.addSubview(rexxleTitle)
        
        // Page title, does not move with pages.
        pageTitle = UILabel(frame: CGRect(x: 0, y: 60, width: 300, height: 50))
        pageTitle.text = pageTitleText
        pageTitle.textColor = UIColor.black
        pageTitle.textAlignment = .center
        view.addSubview(pageTitle)
        
        // Constant Back button which does not move as the user pages
        backButton = createBackButton
        view.addSubview(backButton)

        // Set up auto layout constraints for the button
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100), // adjust constant as needed
            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -300) // adjust constant as needed
        ])
    }
    
    func displayFirstPage() {
        // Display the first page
        if let firstVC = VCArr.first {
            print("BasePageViewController::displayFirstPage - displaying firstVC = [\(firstVC)]")
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // Action method for the button
    @objc func backButtonTapped(_ sender: UIButton) {
        print("BasePageViewController - backButton Was Tapped")

        vcDelegate.presentMenuScreen()
    }
    
    override func viewDidLayoutSubviews() {
        print("BasePageViewController::viewDidLayoutSubviews - Top")
        super.viewDidLayoutSubviews()
        
        // Position titles and buttons
        rexxleTitle.center = CGPoint(x: 130, y: 93)
        pageTitle.center = CGPoint(x: 310, y: 112)
        backButton.center = CGPoint(x: view.frame.width/2, y: view.frame.height - 60)
        
        // Position the scroll view (WHY?) and the page indicator control
        for sview in self.view.subviews {
            print("BasePageViewController::viewDidLayoutSubviews - sview = [\(sview)]")
            if sview is UIScrollView {
                print("BasePageViewController::viewDidLayoutSubviews - sview is a UIScrollView - sview = [\(sview)]")
                sview.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: view.frame.height/2+50)
                sview.backgroundColor = UIColor.orange
            } else if sview is UIPageControl {
                print("BasePageViewController::viewDidLayoutSubviews - sview is a UIPageControl - sview = [\(sview)]")
                sview.backgroundColor = UIColor.purple
                // Save the original size
                let originalFrame = sview.frame
                let newX: CGFloat = (view.frame.size.width/2)-60 // New X coordinate
                let newY: CGFloat = view.frame.size.height/2+200 // New Y coordinate
                sview.frame = CGRect(x: newX, y: newY, width: originalFrame.width, height: originalFrame.height)
            }
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return VCArr.last
        }
        
        guard VCArr.count > previousIndex else {
            return nil
        }
        
        return VCArr[previousIndex]
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCArr.count else {
            return VCArr.first
        }
        
        guard VCArr.count > nextIndex else {
            return nil
        }
        
        return VCArr[nextIndex]
    }

    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArr.count
        
    }

    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArr.firstIndex(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }

}
