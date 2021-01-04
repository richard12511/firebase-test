//
//  SignUpViewController.swift
//  firebase-test
//
//  Created by Richard Schmidt on 1/3/21.
//

import UIKit
import FirebaseAuth
import Firebase

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
    func validateForm() -> String? {
        if (firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            return "Please enter a first name"
        }
        if (lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            return "Please enter a last name"
        }
        if (emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            return "Please enter an email"
        }
        if (passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""){
            return "Please enter a password"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Validator.isPasswordValid(cleanedPassword) == false {
            return "Password must be at least 8 characters, contain one alphabetic character, and contain 1 speacial character."
        }
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateForm()
        if(error != nil) {
            showError(error!)
        }
        else {
            let cleanedFirstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanedLastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: cleanedEmail, password: cleanedPassword) { (res, err) in
                if err != nil {
                    self.showError("Error creating user in database")
                }
                else {
                    let db = Firestore.firestore()
                    db.collection("users")
                        .addDocument(
                            data:["first_name": cleanedFirstName,
                                  "last_name": cleanedLastName,
                                  "uid": res!.user.uid]
                        ) { (dbError) in
                            if dbError != nil {
                                self.showError("Failed to store data in firestore db")
                            }
                        }
                    
                    self.redirectToHome()
                }
            }
        }
    }
    
    func redirectToHome(){
        let homeViewController =
            storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1 //Make it visible
    }
    
}
