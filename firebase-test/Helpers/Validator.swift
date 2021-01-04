//
//  Validator.swift
//  firebase-test
//
//  Created by Richard Schmidt on 1/3/21.
//

import Foundation

class Validator {
    
    static func isPasswordValid(_ password : String) -> Bool{
        //Require:
        //Length 8
        //One alphabet character
        //One special character
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
