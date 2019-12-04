//
//  Profile.swift
//  exampleFirebase
//
//  Created by Sergio Redondo on 20/10/2019.
//  Copyright © 2019 NBTech. All rights reserved.
//

import UIKit

class Profile: NSObject {
    
    var email:String?
    var age:Int?
    var nickName:String?
    
    
    init(valores:[String:Any]) {
        email = valores["email"] as? String
        age = valores["age"] as? Int
        nickName = valores["nick"] as? String
    }

}
