//
//  RootController.swift
//  Multiview_App
//
//  Created by J on 10/13/18.
//  Copyright © 2018 J. All rights reserved.
//

import UIKit

// need to switch custom class the main.storyboard viewcontroller
// class from original viewcontroller to rootcontroller

class RootController: UIViewController {
// private variables which only belong to the Root Controllers optional UIViewControllers
    private var firstViewController : FirstViewController! // default unwraps these optionals
    private var secondViewController : SecondViewController! // default unwraps these optionals
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // will create a UI Toolbar with UIBarButtonItems 
    @IBAction func switchViews(sender: UIBarButtonItem){
        
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
