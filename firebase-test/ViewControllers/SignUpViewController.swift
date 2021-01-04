//
//  SignUpViewController.swift
//  firebase-test
//
//  Created by Richard Schmidt on 1/3/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpElements(){
        errorLabel.alpha = 0;
        Styler.styleTextField(firstNameTextField)
        Styler.styleTextField(lastNameTextField)
        Styler.styleTextField(emailTextField)
        Styler.styleTextField(passwordTextField)
        Styler.styleFilledButton(signUpButton)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUpTapped(_ sender: Any) {
    }
    
}
