//
//  SignUpController.swift
//  Fire App
//
//  Created by Vince G on 5/29/19.
//  Copyright © 2019 Guillaume Corporations. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    
    var signUpView: SignUpView!
    var defaults = UserDefaults.standard
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        setupViews()
       
    }
    
    func setupViews() {
        let signUpView = SignUpView(frame: self.view.frame)
        self.signUpView = signUpView
        self.signUpView.submitAction = submitPressed
        self.signUpView.cancelAction = cancelPressed
        view.addSubview(signUpView)
    }
    
    func submitPressed() {
        guard let email = signUpView.emailTextField.text else { return}
        guard let password = signUpView.confirmPasswordTextField.text else { return }
        guard let name = signUpView.nameTextField.text else { return }
        
        let userData: [String: Any] = [
            "name": name
        ]
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                guard let uid = result?.user.uid else { return }
                self.ref.child("users/\(uid)").setValue(userData)
                self.defaults.set(false, forKey: "UserIsLoggedIn")
                print("Successfully created a user:", uid)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    func cancelPressed() {
        dismiss(animated: true, completion: nil)
    }
}
