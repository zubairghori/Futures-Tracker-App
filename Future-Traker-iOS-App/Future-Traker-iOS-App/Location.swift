//
//  Location.swift
//  Future-Traker-iOS-App
//
//  Created by Admin on 01/02/2016.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

class Location {

    let latittude:Double
    let longitude:Double
    let speed:Double
    let time:NSDate
    
    init(latittude:Double, longitude:Double, speed:Double, time:NSDate){
        self.latittude = latittude
        self.longitude = longitude
        self.speed = speed
        self.time = time
    }
}