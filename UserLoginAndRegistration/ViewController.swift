//
//  ViewController.swift
//  UserLoginAndRegistration
//
//  Created by Nikhil Tanappagol on 8/1/17.
//  Copyright © 2017 Nikhil Tanappagol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
               if (!isUserLoggedIn)
        {
        self.performSegue(withIdentifier: "SegueToLoginView", sender: self)
    }
}
}
