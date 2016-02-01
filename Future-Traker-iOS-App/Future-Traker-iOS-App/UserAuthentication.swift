//
//  UserAuthentication.swift
//  Future-Traker-iOS-App
//
//  Created by Admin on 01/02/2016.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Firebase


class UserAuthentication {
    
    static func signIn(name:String , password:String , trackerUUID:String, completion:(user:User? , error:String?)->Void){
        
        let credentials = ["name":name, "password":password , "trackerUUID":trackerUUID ]
        
        Alamofire.request(.POST, "\(serverRootUrl)/signIn" , parameters: credentials )
            .responseJSON { response in

                let response = JSON(response.result.value!)
               
                if response["sucess"].boolValue {
                    
                    let token = response["token"].stringValue
                  
                    firebaseTokenAuth(token, completion: { (user, error) -> Void in
                        

                        if error==nil{
                            
                            completion(user: user, error: nil)

                        }else{

                            completion(user: nil, error: error)

                        }
                        
                    })
                    
                }else{
                    let status = response["status"].stringValue
                    completion(user: nil, error: status)
                    
            }
        }
        
    }
    
    private static func firebaseTokenAuth(token:String, completion:(user:User? ,error:String?)->Void){
        
        let ref = Firebase(url: firebaseRootUrl)
        
        ref.authWithCustomToken(token) { (error, authData) -> Void in
            
            if error == nil {
                
                let response = JSON(authData.auth)
                let data = response["data"]
                
                let name = data["name"].stringValue
                let email = data["email"].stringValue
                let password = data["password"].stringValue
                let cellNo = data["cellNo"].stringValue
                let address = data["address"].stringValue
                let vehicleNo = data["vehicleNo"].stringValue
                let vehicleModel = data["vehicleModel"].stringValue
                let timestamp = data["timestamp"].stringValue
                let trackerUUID = data["trackerUUID"].stringValue


                let tempUser = User(name: name, email: email, password: password, cellNo: cellNo, address: address, vehicleNo: vehicleNo, vehicleModel: vehicleModel, timestamp: timestamp, trackerUUID: trackerUUID)
                
                User.setCurrentUser(tempUser)
                print(response)
                completion(user: tempUser, error: nil)

            }else{
                
                completion(user: nil, error: error.localizedDescription)
            }
            
        }
        
    }
}
