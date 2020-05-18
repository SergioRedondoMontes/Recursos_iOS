//
//  CoinManager.swift
//  CoinExchange
//
//  Created by Sergio Redondo on 11/05/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol CoinManagerAlamofireDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}


struct CoinManagerAlamofire{
    
    var delegate: CoinManagerAlamofireDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4C024C9A-7B92-4F4F-A62E-BF6257B77ACD"
    
        let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency:String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        AF.request(urlString, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let valor = JSON(value)
                if let rate = valor["rate"].double {
                    let rateString = String(format: "%.2f", rate)
                    self.delegate?.didUpdatePrice(price: rateString, currency: currency)
                }else{
                    print("error")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
