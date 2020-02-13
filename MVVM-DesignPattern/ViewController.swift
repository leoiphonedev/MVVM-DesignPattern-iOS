//
//  ViewController.swift
//  MVVM-DesignPattern
//
//  Created by Aman Aggarwal on 21/12/19.
//  Copyright © 2019 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblMessage:UILabel!
    @IBOutlet weak var txtUserName:UITextField!
    @IBOutlet weak var txtPassword:UITextField!

    var authenticationVM = AuthenticationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.lblMessage.isHidden = true
    }

    //MARK:- loginUser
    @IBAction func loginUser(_ sender: Any) {
        self.lblMessage.isHidden = true
        guard let userName = self.txtUserName.text else {return}
        guard let password = self.txtPassword.text else {return}
        
        authenticationVM.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                self.lblMessage.text = "Logged in with username = \(self.authenticationVM.username) and email = \(self.authenticationVM.email)"
                self.lblMessage.isHidden = false
            } else {
                self.lblMessage.text = message
                self.lblMessage.isHidden = false
            }
        }
        authenticationVM.authenticateUserWith(userName, andPassword: password)
    }
}


//MARK:- MVVM
//M -> Model : it conatint data/info for our app
//V -> View/ViewController: it represents the UI and data displayed to user
//VM -> View Model : it acts as a bridge between modell and view and conatins business logic for the view
