//
//  GameViewController.swift
//  240410VCTest
//
//  Created by Steven Dyer on 4/10/24.
//

import UIKit
import SpriteKit
import GameplayKit


func debugDelay(_ seconds: Int) async {
    let ns = UInt64(seconds) * 1_000_000_000
    do {
        try await Task.sleep(nanoseconds: ns)
    } catch {
        print("dreadful shame")
    }
}


class MainViewController: UIViewController {
    var currentVC: UIViewController?
    var showingAds: Bool = true
    var heightPercent: CGFloat = 1.0
    var adViewController: UIViewController!
    
    override func viewDidLoad() {
        print("MainViewController::viewDidLoad - Top")
        super.viewDidLoad()
        
        heightPercent = (showingAds ? 0.8 : 1.0)

        
        // Show Loading Screen
        presentLoadingScreen()
        
        // Start loading process
        Task {
            await doAppLoad()
        }
        print("MainViewController::viewDidLoad - after doAppLoad - children = [\(self.children)]")
    }
    
    func presentLoadingScreen() {
        print("MainViewController::presentLoadingScreen - Top")
        let vc = LoadingViewController()
        addChild(vc)
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        currentVC = vc
    }
    
    func doAppLoad() async {
        print ("MainViewController::doAppLoad - Top - time = \(Date())")
        await debugDelay(1) // DEBUG
        print ("MainViewController::doAppLoad - after delay - time = \(Date())")
        
        finishViewControllerLoad()
    }
        
    func finishViewControllerLoad() {
        print("MainViewController::finishViewControllerLoad - top - view.frame = [\(view.frame)]")
        // Add the Ad View
        adViewController = AdViewController()
        addChild(adViewController)
        adViewController.view.frame = CGRect(x: 0, y: view.frame.height * heightPercent, width: view.frame.width, height: view.frame.height - (view.frame.height * heightPercent))
        print("MainViewController::finishViewControllerLoad - adViewController.view.frame = [\(adViewController.view.frame)]")
        view.addSubview(adViewController.view)
        adViewController.didMove(toParent: self)
 
        // Show the start page
        presentStartScreen()
    }

    override func viewDidLayoutSubviews() {
        print("MainViewController::viewDidLayoutSubviews - top")
        print("MainViewController::viewDidLayoutSubviews - children = [\(self.children)]")
        super.viewDidLayoutSubviews()
        
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension MainViewController: ViewControllerDelegate {
    
    func presentStartScreen() {
        print ("MainViewController::presentStartScreen - top")
        
        let vc = StartPageViewController()
        vc.vcDelegate = self
        addChild(vc)
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.height * heightPercent) + 100)

        // No transition, just add the subview directly
        view.addSubview(vc.view)
        vc.didMove(toParent: self)

        if let cvc = currentVC {
            cvc.willMove(toParent: nil)
            cvc.view.removeFromSuperview()
            cvc.removeFromParent()
        }
        
        currentVC = vc
    }
    
    func presentMenuScreen(doReveal: Bool) {
        print ("MainViewController::presentMenuScreen - top")
        
        // Set height based on showing ads or not
        print ("MainViewController::presentMenuScreen - heightPercent=[\(heightPercent)]")
        print("MainViewController::presentMenuScreen - children = [\(self.children)]")
        
        //        presentingViewController?.dismiss(animated: true)
        
        // Show the screen
        let vc = MenuViewController()
        vc.vcDelegate = self
        
        addChild(vc)
        print("MainViewController::presentMenuScreen - after addchild - children = [\(self.children)]")
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * heightPercent)
        currentVC!.willMove(toParent: nil)
        if doReveal {
            beginAnimationRevealUp(fromView: currentVC!.view, toView: vc.view)
        } else {
            beginAnimation(fromView: currentVC!.view, toView: vc.view)
        }
        var transitionTime = 0.4
        if doReveal { transitionTime = 0.4 }
        transition(
            from: currentVC!,
            to: vc,
            duration: transitionTime,
            options: [.curveEaseOut],
            animations: {
                if doReveal {
                    self.endAnimationRevealUp(
                        fromView: self.currentVC!.view,
                        toView: vc.view
                    )
                } else {
                    self.endAnimation(
                        fromView: self.currentVC!.view,
                        toView: vc.view
                    )
                }
            },
            completion: { _ in
                vc.didMove(toParent: self)
                if let cvc = self.currentVC {
                    cvc.willMove(toParent: nil)
                    cvc.view.removeFromSuperview()
                    cvc.removeFromParent()
                }
                //               self.currentVC!.removeFromParent()
                self.currentVC = vc
            }
        )
        
        view.bringSubviewToFront(adViewController.view)
    }
    
    /* Reveal Up TRANSFORM - dislpays the toView by sliding it up over the fromView */
    private func beginAnimationRevealUp(fromView: UIView, toView: UIView) {
        print("beginAnimationRevealUp")
        fromView.transform = CGAffineTransform.identity
        toView.transform = CGAffineTransform(translationX: 0, y: view.frame.height * heightPercent)
    }

    private func endAnimationRevealUp(fromView: UIView, toView: UIView) {
        print("endAnimationRevealUp")
        fromView.transform = CGAffineTransform.identity
        toView.transform = CGAffineTransform.identity
    }

    /* Reveal Down TRANSFORM - displays the toView by sliding the fromView down */
    private func beginAnimationRevealDown(fromView: UIView, toView: UIView) {
        print("beginAnimationRevealDown")
        fromView.transform = CGAffineTransform.identity
        toView.transform = CGAffineTransform.identity
    }

    private func endAnimationRevealDown(fromView: UIView, toView: UIView) {
        print("endAnimationRevealDown")
        fromView.transform = CGAffineTransform(translationX: 0, y: view.frame.height * heightPercent)
        toView.transform = CGAffineTransform.identity
    }

    /* CROSS DISSOLVE TRANSFORM */
    private func beginAnimation(fromView: UIView, toView: UIView) {
        fromView.alpha = 1.0
        toView.alpha = 0.0
    }

    private func endAnimation(fromView: UIView, toView: UIView) {
        fromView.alpha = 0.0
        toView.alpha = 1.0
    }

    /* MOVE IN TRANSFORM */
/*    private func beginAnimation(fromView: UIView, toView: UIView) {
        fromView.transform = CGAffineTransform.identity
        toView.transform = CGAffineTransform(translationX: 500, y: 0)
    }

    private func endAnimation(fromView: UIView, toView: UIView) {
        fromView.transform = CGAffineTransform(translationX: -500, y: 0)
        toView.transform = CGAffineTransform.identity
    }*/
    
    
/* FUNKY 3D TRANSFORM */
/*    private func transform(angle: Double) -> CATransform3D {
        let angleRads = angle * .pi / 180.0
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -100
        transform = CATransform3DRotate(transform, angleRads, 1, 0, 0)
        transform = CATransform3DTranslate(transform, 0, 0, -10)
        return transform
    }

    private func beginAnimation(fromView: UIView, toView: UIView) {
        fromView.layer.transform = CATransform3DIdentity
        toView.layer.transform = transform(angle: -90)
    }

    private func endAnimation(fromView: UIView, toView: UIView) {
        fromView.layer.transform = transform(angle: 90)
        toView.layer.transform = CATransform3DIdentity
    }
*/
    
    func presentGameScreen() {
        print("MainViewController::presentGameScreen - top")
        
        let vc = GameViewController()
        vc.vcDelegate = self
        
        addChild(vc)
        vc.view.layer.zPosition = -1.0 // This places the game *behind* the menu, so that as the menu slides down, the game is revealed.  A "reveal" transition.
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * heightPercent)
        vc.didMove(toParent: self)
        currentVC!.willMove(toParent: nil)
        beginAnimationRevealDown(fromView: currentVC!.view, toView: vc.view)
        transition(
            from: currentVC!,
            to: vc,
            duration: 0.4,
            options: [.curveEaseOut],
            animations: {
                self.endAnimationRevealDown(
                    fromView: self.currentVC!.view,
                    toView: vc.view
                )
            },
            completion: { _ in
                vc.didMove(toParent: self)
                if let cvc = self.currentVC {
                    cvc.willMove(toParent: nil)
                    cvc.view.removeFromSuperview()
                    cvc.removeFromParent()
                }
                self.currentVC = vc
            }
        )
        
        // Make sure the add view stays on top
        view.bringSubviewToFront(adViewController.view)
    }
    
    func presentHelpScreen() {
        print("MainViewController::presentHelpScreen - top")
        print("MainViewController::presentHelpScreen - children = [\(self.children)]")

        // Create the new vc
        let vc = HelpPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.vcDelegate = self
        
        // Transition to the new vc
        addChild(vc)
        print("MainViewController::presentHelpScreen - after addchild - children = [\(self.children)]")
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * heightPercent) // triggers help page vc viewDidLoad
        print("MainViewController::presentHelpScreen - vc.view.frame = [\(vc.view.frame)]")
        currentVC!.willMove(toParent: nil)
        beginAnimation(fromView: currentVC!.view, toView: vc.view)
        transition(
            from: currentVC!,
            to: vc,
            duration: 0.4,
            options: [.curveEaseOut],
            animations: {
                self.endAnimation(
                    fromView: self.currentVC!.view,
                    toView: vc.view
                )
            },
            completion: { _ in
                vc.didMove(toParent: self)
               if let cvc = self.currentVC {
                    cvc.willMove(toParent: nil)
                    cvc.view.removeFromSuperview()
                    cvc.removeFromParent()
                }
                self.currentVC = vc
            }
        )
        
        // Make sure the add view stays on top
        view.bringSubviewToFront(adViewController.view)
    }

    func showAdView() {
        print ("MainViewController::presentAdView - top")
    }
    
    func removeAdView() {
        print ("MainViewController::removeAdView - top")
    }
    
    func presentRexScreen() {
        print("MainViewController::presentRexScreen - top")
        
        let vc = RexViewController()
        vc.vcDelegate = self

        addChild(vc)
        print("MainViewController::presentRexScreen - after addchild - children = [\(self.children)]")
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * heightPercent)
        currentVC!.willMove(toParent: nil)
        beginAnimation(fromView: currentVC!.view, toView: vc.view)
        transition(
            from: currentVC!,
            to: vc,
            duration: 0.4,
            options: [.curveEaseOut],
            animations: {
                self.endAnimation(
                    fromView: self.currentVC!.view,
                    toView: vc.view
                )
            },
            completion: { _ in
                print("MainViewController::presentRexScreen - Completion")
                vc.didMove(toParent: self)
                if let cvc = self.currentVC {
                    cvc.willMove(toParent: nil)
                    cvc.view.removeFromSuperview()
                    cvc.removeFromParent()
                }
                self.currentVC = vc
            }
        )
    }
    
}
