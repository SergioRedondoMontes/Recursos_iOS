//
//  WebRequest.swift
//
//  Created by Sergio Redondo on 13/4/18.
//

import UIKit
import Foundation
import SystemConfiguration
import Alamofire
import SwiftyJSON

//Static class
class WebRequest: NSObject {
    static let sharedInstance:WebRequest=WebRequest()
    
    //Constants
    let OPEN_URL = "http://unawebcualquier.com"
    let headers: HTTPHeaders = [
        "Accept": "text,plain",
        "Content-Type": "application/json"
    ]
    
    //all Request to API
    func genericRequest(url:String, parameters:[String:String],delegate:WebRequestDelegate) {
        if isInternetAvailable(){
            
            Alamofire.request(url, method: .post, parameters: parameters,encoding: JSONEncoding(),headers: headers).responseData(
                completionHandler:{
                    response in
                    if let data = response.result.value, let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                        if let dictionary = json as? [String: Any] {
                            if let result = dictionary["result"] as? String {
                                if let location = dictionary["location"] as? String, !location.isEmpty{
                                    DataHolder.sharedInstance.address = location
                                }
                                if let phoneNumber = dictionary["phoneNumber"] as? String, !phoneNumber.isEmpty{
                                    DataHolder.sharedInstance.phoneNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
                                }
                                if let managerName = dictionary["managerName"] as? String, !managerName.isEmpty{
                                    DataHolder.sharedInstance.managerName = managerName
                                }
                                delegate.WRDComunication!(result: result)
                            }
                        }
                    }
            })
        }else{
            //Errors
            let myAlert = UIAlertController(title: NSLocalizedString("No hay conexión a internet", comment: ""), message: NSLocalizedString("Para el uso de esta aplicación se requiere conexión a Internet en su dispositivo. Inténtelo de nuevo", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: UIAlertActionStyle.default, handler: { action in
                exit(0)
            })
            myAlert.addAction(okAction)
            DispatchQueue.main.async {
                UIApplication.topViewController()?.present(myAlert, animated: true, completion: nil)
            }
        }
    }
    
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
}

@objc protocol WebRequestDelegate {
    @objc optional func WRDComunication(result:String)
}

//This extension is used to display the alert of the func genericRequest
extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}

