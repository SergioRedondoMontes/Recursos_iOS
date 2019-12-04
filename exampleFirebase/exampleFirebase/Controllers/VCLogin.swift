//
//  VCLogin.swift
//  exampleFirebase
//
//  Created by Sergio Redondo on 20/10/2019.
//  Copyright © 2019 NBTech. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn
import CoreData

class VCLogin: UIViewController {
    
    @IBOutlet var txtfMail:UITextField?
    @IBOutlet var txtfPass:UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func btnLogIn() {
        
        //FireBase sign in
        Auth.auth().signIn(withEmail: (txtfMail?.text)!, password: (txtfPass?.text)!) { (user, error) in
            
            if(error == nil){
                let user = Auth.auth().currentUser
                if let user = user {
                    DataHolder.sharedInstance.userAuth = user
                    //                      self.performSegue(withIdentifier: "next", sender: self)
                    //TODO: PASO DE PANTALLA
                }
                //                self.loadProfile(userID: (user?.uid)!)
                
            }else{
                //TODO: control de errores
            }
        }
    }
    
}
