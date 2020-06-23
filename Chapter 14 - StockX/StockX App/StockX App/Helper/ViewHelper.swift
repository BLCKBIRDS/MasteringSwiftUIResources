//File: ViewHelper.swift
//Project: StockX App

//Created at 23.06.20 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for free SwiftUI tutorials & more

import Foundation
import SwiftUI

 func getPercentageChange(stockData: [DataEntry]) -> Double {
        if let lastEntryClose = stockData.last?.close, let firstEntryClose = stockData.first?.close {
            return ((lastEntryClose-firstEntryClose)/lastEntryClose)*100
        } else {
            return 0
    }
}

func bullushBearishGradient(lastClose: Double, firstClose: Double) -> Gradient {
    if lastClose < firstClose {
        return Gradient(colors: [Color.red, Color.clear])
    } else {
        return Gradient(colors: [Color.green, Color.clear])
    }
}
