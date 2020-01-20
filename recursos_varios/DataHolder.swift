//
//  DataHolder.swift
//
//  Created by Sergio Redondo on 11/4/18.
//

import UIKit

//clase estatica que va a mantener la consistencia de datos entre las views
class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder=DataHolder()
    
    //variables
    var address:String = ""
    var phoneNumber:String = ""
    var managerName:String = ""
    
    

    
}

