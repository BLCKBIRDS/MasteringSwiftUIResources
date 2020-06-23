//File: JSONModel.swift
//Project: StockX App

//Created at 23.06.20 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for free SwiftUI tutorials & more

import Foundation

struct TimeSeriesJSON: Decodable {
    
    let timeSeries: [String: TimeSeries]
    
    private enum CodingKeys : String, CodingKey {
        case timeSeries = "Time Series (15min)"
    }
    
    struct TimeSeries: Decodable {
        let open, close, high, low: String
        
        private enum CodingKeys : String, CodingKey {
            case open = "1. open"
            case high = "2. high"
            case low = "3. low"
            case close = "4. close"
        }
    }
 }
