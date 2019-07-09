//
//  APICallManager.swift
//  Movies App
//
//  Created by Esraa Hassan on 7/8/19.
//  Copyright © 2019 Developers. All rights reserved.
//





import UIKit
import Alamofire
import SwiftyJSON


//let API_BASE_URL = "https://api.themoviedb.org/3/authentication/token/new"
class APICallManager {
    static let instance = APICallManager()
    func getrequestToken (completionHandler: @escaping (_ token:String?) -> Void){
        let url = "https://api.themoviedb.org/3/authentication/token/new?api_key=a6b36328e027adf7d2cf115046c6dd11"
    
        Alamofire.request(url)
        .responseJSON { response in
    guard response.result.isSuccess,
    let value = response.result.value else {
    print("Error while fetching tags: \(String(describing: response.result.error))")
    completionHandler(nil)
    return
    }

            let requestToken = JSON(value)["request_token"].stringValue
            print("request token:\(requestToken)")
        completionHandler(requestToken)
     }
    }


    func login(userName : String , password :String ,requestToken :String, completionHandeler : @escaping (_ error :Error? , _ success : Bool )-> Void){
        
        let loginUrl : String = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=a6b36328e027adf7d2cf115046c6dd11"
        let parameters = [
            "username": userName , //email
            "password": password ,//password
            "request_token" : requestToken
        ]
        
        Alamofire.request(loginUrl, method: .post, parameters: parameters)
            .responseJSON { response in
            
                switch response.result {
                case .success(let value):
                    let json  = JSON(value)
                    if let success = json["success"].int , success == 1
                    {
                        // show alert
                         print("The value of success is: \(success)")
                        completionHandeler(nil,true)
                    }
                    else {
                        completionHandeler(nil , false)
                    }
                    
            
                case .failure(let error):
                    completionHandeler(error,false)
                    print (error)
                    
                }
                
                
        
        
    }
   

    }
    
    }

