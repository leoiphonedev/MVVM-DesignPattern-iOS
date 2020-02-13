//
//  AuthenticationVM.swift
//  MVVM-DesignPattern
//
//  Created by Aman Aggarwal on 22/12/19.
//  Copyright © 2019 Aman Aggarwal. All rights reserved.
//

import Foundation

class AuthenticationVM: NSObject {
    var user: User!
    
    var username: String {
        return user.userName
    }
    var email: String {
        return user.email
    }
    
    typealias authenticationLoginCallBack = (_ status:Bool, _ message:String) -> Void
    var loginCallback:authenticationLoginCallBack?
    
    func authenticateUserWith(_ username:String, andPassword password:String) {
            if username.count  != 0 {
                if password.count != 0 {
                    self.verifyUserWith(username, andPassword: password)
                } else {
                    ///password empty
                    self.loginCallback?(false, "Password should not be empty")
                }
            } else {
                // username empty
                self.loginCallback?(false, "Username should not be empty")
            }
    }
    
    
    //MARK:- verifyUserWith
    fileprivate func verifyUserWith(_ username:String, andPassword password:String) {
        if username == "test" && password == "123456" {
            user = User(userName: username, email: "\(username)@testmail.com")
            self.loginCallback?(true, "User is successfully authenticated")
        } else {
            // invalid credentials
            self.loginCallback?(false, "Please enter valid crenetials")
        }
    }
    
    //MARK:- loginCompletionHandler
    func loginCompletionHandler(callBack: @escaping authenticationLoginCallBack) {
        self.loginCallback = callBack
    }
}
