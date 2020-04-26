//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

//protocol CoindManagerDelegate {
//    func didUpdateCoing()
//    func didFailWithError(error: Error)
//}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "53C1F67B-0E7A-4D3F-9C48-D838972E40F6"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    //var delegate: CoindManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        
        //Use String concatenation to add the selected currency at the end of the baseURL along with the API key.
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        //Use optional binding to unwrap the URL that's created from the urlString
        if let url = URL(string: urlString) {
            
            //Create a new URLSession object with default configuration.
            let session = URLSession(configuration: .default)
            
            //Create a new data task for the URLSession
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let coinPrice = self.parseJSON(safeData)
                }
            }
            //Start task to fetch data from bitcoin average's servers.
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            print("LAST PRICE", lastPrice)
            return lastPrice
            
        } catch {
            //delegate?.didFailWithError(error: Error)
            print(error)
            return nil
        }
    }
}
