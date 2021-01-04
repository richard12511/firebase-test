//
//  ViewController.swift
//  firebase-test
//
//  Created by Richard Schmidt on 1/3/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        Styler.styleFilledButton(signUpButton)
        Styler.styleHollowButton(loginButton)
    }


}

