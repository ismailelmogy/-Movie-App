//
//  APICallManager.swift
//  Movies App
//
//  Created by Esraa Hassan on 7/8/19.
//  Copyright © 2019 Developers. All rights reserved.
//




import Foundation
import Alamofire


//let API_BASE_URL = "https://api.themoviedb.org/3/authentication/token/new"
class APICallManager {
    static let instance = APICallManager()
    
    func getRequestToken () -> String {
        let url = "https://api.themoviedb.org/3/authentication/token/new?api_key=a6b36328e027adf7d2cf115046c6dd11"
       var requestTokenFromApi : String? = nil
        
        Alamofire.request(url)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get request token  object as JSON from API")
                    if let error = response.result.error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                // get and print the request token
                guard let requestToken = json["request_token"] as? String else {
                    print("Could not get request_token from JSON")
                    return
                }
                print("The value of request token is: " + requestToken)
                requestTokenFromApi =  requestToken
                
            }
      
        
        if requestTokenFromApi != nil{
            return requestTokenFromApi!
        }
        else{
          return "nil"
        }
        
    }
    

    
   
    
    }

