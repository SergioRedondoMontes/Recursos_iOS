//
//  Dataholer.swift
//  exampleFirebase
//
//  Created by Sergio Redondo on 18/10/2019.
//  Copyright © 2019 NBTech. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class DataHolder: NSObject {
    
    
    var tokenUser:String?
    var googleMail:String?
    var userID:String?
    
    var delegate:DataHolderDelegate?

    static let sharedInstance:DataHolder=DataHolder()
    var userAuth:User?
    var db: Firestore!
    
    var miPerfile:Profile?
    
    func initFireBase(){
        FirebaseApp.configure()
        db = Firestore.firestore()
        
        Auth.auth().addStateDidChangeListener() { (auth, user) in
            if let user = user {
                // User is signed in.
                DataHolder.sharedInstance.userAuth=user
                self.delegate?.DataHolderUserLogIn(user: user)
            } else {
                // No user is signed in.
            }
        }
    }
    
    func saveDataOnDataHolder(name:String, age:Int) {
        self.miPerfile?.nickName = name
        self.miPerfile?.age = age
    }
    
    func saveDataOnCoreData(name:String, age:Int) -> Bool {
        PersistenceService.deleteAllCodesRecords()
        let users = Users(context: PersistenceService.context)
        users.setValue(name, forKey: "name")
        users.setValue(age, forKey: "age")
        return PersistenceService.saveContext()
    }
}

protocol DataHolderDelegate {
    func DataHolderUserLogIn(user:User)
}
