//
//  FirstViewController.swift
//  Multiview_App
//
//  Created by J on 10/13/18.
//  Copyright © 2018 J. All rights reserved.
//

import UIKit

// Changed the mainstory viewcontroller scene from UIViewController to FirstViewController

// Also need to change the indentifier so you can call the viewcontroller storyboard from code i.e. First

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender:UIButton){
        let alert = UIAlertController(title:"First Button Pressed", message: "You've pressed the first button", preferredStyle: .alert)
        //
        let action = UIAlertAction(title: "Yes I did", style: .default, handler: nil)
        alert.addAction(action)
        //
        present(alert, animated: true, completion: nil)
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
