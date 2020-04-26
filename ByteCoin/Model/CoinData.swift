//
//  CoinData.swift
//  ByteCoin
//
//  Created by Michell Hornung on 26/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}

//"time": "2020-04-26T18:41:09.6507407Z",
//"asset_id_base": "BTC",
//"asset_id_quote": "USD",
//"rate": 7626.909369650423
