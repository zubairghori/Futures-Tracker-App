//
//  ViewController.swift
//  Future-Traker-iOS-App
//
//  Created by Admin on 31/01/2016.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import SwiftSpinner
import BRYXBanner


class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
  
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var trackerID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
           }

    @IBAction func singIn(sender: AnyObject) {
       
        SwiftSpinner.show("Authenticating user account")

        UserAuthentication.signIn(name.text!, password: password.text! , trackerUUID: "vxcsfsdffsczxc") { (user, error) -> Void in
            
            if error == nil {
                print(User.LoggedInUser?.name)
            }else{
                let banner = Banner(title: "Message", subtitle: "\(error!)", backgroundColor: UIColor.redColor())
                banner.dismissesOnTap = true
                banner.show(duration: 3.0)
            }
            
            SwiftSpinner.hide()
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

