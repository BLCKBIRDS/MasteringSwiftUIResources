//File: DataEntry.swift
//Project: StockX App

//Created at 23.06.20 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for free SwiftUI tutorials & more

import Foundation

struct DataEntry: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let close: Double
}

let sampleData = [
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, close: 2.33),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, close: 17.319),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, close: 13.94),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, close: 20.4882)
]
