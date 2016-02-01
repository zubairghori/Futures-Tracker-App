//
//  Map.swift
//  Future-Traker-iOS-App
//
//  Created by Admin on 01/02/2016.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import Firebase

class Map {
    
   static var Locations = [NSDate:[Location]]()

    
    static func addLocationInMap(currentLocation:[Location],currentDate:NSDate){
        
        self.Locations[currentDate] = currentLocation
    }
    

    func getCurrentLocations(name:String, trackerUUID:String, completion:(locations:[NSDate:[Location]])->Void){
        
        let ref = Firebase(url: "\(firebaseRootUrl)/Maps\(name)-\(trackerUUID)")
        ref.queryOrderedByChild("timestamp")
        
    }

}