//
//  CoinManager.swift
//  CoinExchange
//
//  Created by Sergio Redondo on 11/05/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}


struct CoinManager{
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4C024C9A-7B92-4F4F-A62E-BF6257B77ACD"
    
        let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency:String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData){
                      let priceString = String(format: "%.2f", bitcoinPrice)
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
                
            }
            task.resume()
        }else{
            print("error")
        }
    }
    
    func parseJSON(_ data:Data) -> Double? {
        let decoder = JSONDecoder()
        do{
            let decodableData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodableData.rate
            return lastPrice
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
