//
//  LoginViewController.swift
//  NexseedChat
//
//  Created by 辻真緒 on 2019/08/15.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    

}
extension LoginViewController: GIDSignInDelegate, GIDSignInUIDelegate {

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // エラーが発生したら中断
        if let error = error {
            print("エラー発生: \(error.localizedDescription)")
            return
        }
        
        let authentication = user.authentication
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication!.idToken, accessToken: authentication!.accessToken)
        
        
        Auth.auth().signIn(with: credential) { (authDataResult, error) in

            if let error = error {
                print("失敗\(error.localizedDescription)")
                
            } else {
                print("成功")
                self.performSegue(withIdentifier: "toChat", sender: nil)
            }

        }
        
        
    }
    
    
    
    
}
