//
//  ViewController.swift
//  Future-Traker-iOS-App
//
//  Created by Admin on 31/01/2016.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
        UserAuthentication.signIn("zubair", password: "123", trackerUUID: "vxcsfsdffsczxc") { (user, error) -> Void in

            if error == nil {
                print(User.LoggedInUser?.name)
            }else{
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

