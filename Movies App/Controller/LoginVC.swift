//
//  ViewController.swift
//  Movies App
//
//  Created by Esraa Hassan on 7/7/19.
//  Copyright © 2019 Developers. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class LoginVC: UIViewController {

    let alertTitle :String? = "Alert Authentication"
    let positiveButtonText = "OK"
    var alertMessage : String? = nil
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var requestToken : String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        
        guard let userName = userNameTF.text ,!userName.isEmpty else{
            // show alert
            self.alertMessage = "User Name is Empty"
            Utils.sharedInstance.showAlertView(title: self.alertTitle , message: self.alertMessage!, actionTitles:  [self.positiveButtonText],actions: nil)
            return
        }
        
        guard let password = passwordTF.text , !password.isEmpty else {
            // show alert
            self.alertMessage = "Password is Empty"
            Utils.sharedInstance.showAlertView(title: self.alertTitle , message: self.alertMessage!, actionTitles:  [self.positiveButtonText],actions: nil)
            return
        }
        
        APICallManager.instance.getrequestToken { (result :String?) in
            self.requestToken = result
            print("req : \(String(describing: self.requestToken!))")
            APICallManager.instance.login(userName: self.userNameTF.text!, password: self.passwordTF.text!, requestToken: self.requestToken!, completionHandeler:
                { (error : Error?, success : Bool) in
                    if success {
                     let def = UserDefaults.standard
                     def.setValue(self.userNameTF.text!, forKey: Utils.USER_NAME)
                     def.setValue(self.passwordTF.text!, forKey: Utils.PASSWORD)
                     def.synchronize()
                     self.navigateToMainVC()
                    }
                    else{
                        self.alertMessage = "Make Sure that user name and password or may be token expired"
                        Utils.sharedInstance.showAlertView(title: self.alertTitle , message: self.alertMessage!, actionTitles:  [self.positiveButtonText],actions: nil)
                    }
             })
            
        }
        
    }
    
    
    func navigateToMainVC() {
        /*
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "main") as! MainVC
        self.navigationController?.pushViewController(mainVC, animated: true)
 */
        let tab = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
         self.navigationController?.pushViewController(tab, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

