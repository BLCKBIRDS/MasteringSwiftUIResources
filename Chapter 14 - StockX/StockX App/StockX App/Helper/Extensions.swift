//File: Extensions.swift
//Project: StockX App

//Created at 23.06.20 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for free SwiftUI tutorials & more

import Foundation

extension Date {
    
    init(_ dateString:String, dateFormat: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    func isInLastNDays(lastDate: Date, dayRange n: Int) -> Bool {
        let startDate = Calendar.current.date(byAdding: .day, value: -n, to: Date())!
        return (min(startDate, lastDate) ... max(startDate, lastDate)).contains(self)
    }
 
}
