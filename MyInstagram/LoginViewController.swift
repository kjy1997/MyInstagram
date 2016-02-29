//
//  LoginViewController.swift
//  MyInstagram
//
//  Created by Jiayi Kou on 2/23/16.
//  Copyright © 2016 Jiayi Kou. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func onSignin(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(
            usernameField.text!, password: passwordField.text!) { (user:PFUser?, error:NSError?) -> Void in
                if user != nil {
                    print("You're logged in")
//                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                }
        }
    }
    
//    func presentViewController(: UIViewController,
//        animated flag: Bool,
//        completion completion: (() -> Void)?)
    
    @IBAction func onSignup(sender: AnyObject) {
        let newUser = PFUser();
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if success {
                print("Created a user")
            }else{
                print("\(error?.localizedDescription)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
