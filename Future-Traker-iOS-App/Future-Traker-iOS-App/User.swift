//
//  User.swift
//  Future-Traker-iOS-App
//
//  Created by Admin on 01/02/2016.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class User {

    static var LoggedInUser: User?
    
    
    var name:String
    var email:String
    var password:String
    var cellNo:String
    var address:String
    var vehilceNo:String
    var vehicleModel:String
    var timestamp:String
    var trackerUUID:String
    
    init(name:String, email:String , password:String , cellNo:String , address:String , vehicleNo:String, vehicleModel:String , timestamp:String , trackerUUID:String){

        self.name = name
        self.email = email
        self.password = password
        self.cellNo = cellNo
        self.address = address
        self.vehilceNo = vehicleNo
        self.vehicleModel = vehicleModel
        self.timestamp = timestamp
        self.trackerUUID = trackerUUID
        
        
    }
    
    static func setCurrentUser(user:User){
        
        self.LoggedInUser = user
    }
    
}