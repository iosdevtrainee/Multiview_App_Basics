//
//  RootController.swift
//  Multiview_App
//
//  Created by J on 10/13/18.
//  Copyright © 2018 J. All rights reserved.
//

import UIKit
//RootController has as outlet connected automatically by Xcode
//This is inherited from the parent class UIViewController
//The outlet and the view are connected to each other to inheritance and Xcode plumbing.


// need to switch custom class the main.storyboard viewcontroller
// class from original viewcontroller to rootcontroller

// Storyboard entrypoint tells the app which view/scene to run when the
// app first launches

class RootController: UIViewController {
// private variables which only belong to the Root Controllers optional UIViewControllers
    private var firstViewController : FirstViewController! // default unwraps these optionals
    private var secondViewController : SecondViewController! // default unwraps these optionals
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?){
        if fromVC != nil {
            fromVC!.willMove(toParent: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParent() // i.e. removeFromParentViewController
        }
        
        if toVC != nil {
            // makes the incoming view a child of root controller
            self.addChild(toVC!)
            // adds the subview within the currently displayed view
            // you insert at the back because you want to be sure that the view will not
            // obfuscate the toolbar *test other indices*
            self.view.insertSubview(toVC!.view, at: 0)
            // Notifies the child that it has become a child of other view controller
            // The child could have overriden this method and implemented custom behavior
            self.didMove(toParent: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup the default view that will be shown to the user
        // get the view from the storyboard object and look for the identifier
        // The first identifier has to be configured in the storyboard for this to work
        firstViewController = storyboard?.instantiateViewController(withIdentifier: "First") as! FirstViewController
        // set the first VC view to the content view of the rootController
        firstViewController.view.frame = view.frame
        // the switching method which will initialize and display the new view
//        switchViewController(from: nil, to:firstViewController)
        // Do any additional setup after loading the view.
        // We don't load both views for efficiency's sake and we don't want wasted resources
    }
    
    // will create a UI Toolbar with UIBarButtonItems 
    @IBAction func switchViews(sender: UIBarButtonItem){
        // optional safe unwrapping for the view
        // This will only be nil if the view is not currently being
        // shown to the user or this view doesn't exist yet and has not been
        // instantiated
        if secondViewController?.view.superview == nil {
            // optional unwrapping for the entire object
            if secondViewController == nil {
                secondViewController = storyboard?.instantiateViewController(withIdentifier: "Second") as! SecondViewController
            }
        } else if firstViewController?.view.superview == nil{
                if firstViewController == nil {
                    firstViewController = storyboard?.instantiateViewController(withIdentifier: "First") as! FirstViewController
                }
        }
        // All animations need an animation block which configures the
        // incoming animations
        // Declare the type of animation
        // Select the duration and transition curve
        // i.e. the timing of how the animation should
        // happen look up the different timings ease etc.
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeOut)
        if firstViewController != nil &&
            firstViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(from: firstViewController, to: secondViewController)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(from: secondViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // deallocate the memory assigned to the firstViewController object when the
        // view is not in view during low memory conditions.
        if firstViewController != nil &&
           firstViewController.view.superview == nil {
            firstViewController = nil
        }
        // deallocate the memory assigned to the secondViewController object when the
        // view is not in view during low memory conditions.
        if secondViewController != nil &&
            secondViewController.view.superview == nil {
            secondViewController = nil
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
