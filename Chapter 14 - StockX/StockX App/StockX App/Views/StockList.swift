//File: StockList.swift
//Project: StockX App

//Created at 23.06.20 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for free SwiftUI tutorials & more

import SwiftUI

struct StockList: View {
    var body: some View {
        NavigationView {
            List {
                StockListRow(stockSymbol: "AAPL", stockName: "Apple, Inc.", downloadManager: DownloadManager(stockSymbol: "AAPL"))
                StockListRow(stockSymbol: "AMZN", stockName: "Amazon.com, Inc.", downloadManager: DownloadManager(stockSymbol: "AMZN"))
                StockListRow(stockSymbol: "TSLA", stockName: "Tesla Inc.", downloadManager: DownloadManager(stockSymbol: "TSLA"))
                StockListRow(stockSymbol: "GOOG", stockName: "Alphabet Inc.", downloadManager: DownloadManager(stockSymbol: "GOOG"))
                StockListRow(stockSymbol: "NFLX", stockName: "Netflix, Inc.", downloadManager: DownloadManager(stockSymbol: "NFLX"))
            }
                .navigationBarTitle("StockX")
        }
    }
}

struct StockList_Previews: PreviewProvider {
    static var previews: some View {
        StockList()
    }
}

struct StockListRow: View {
    
    let stockSymbol: String
    let stockName: String
    
    @ObservedObject var downloadManager: DownloadManager
    
    var body: some View {
        HStack {
            NavigationLink(destination: ContentView(stockSymbol: stockSymbol, downloadManager: downloadManager)) {
                VStack(alignment: .leading) {
                    Text(stockSymbol)
                        .font(.custom("Avenir", size: 20))
                        .fontWeight(.medium)
                    Text(stockName)
                        .font(.custom("Avenir", size: 16))
                }
                Spacer()
                if downloadManager.dataFetched {
                    VStack(alignment: .trailing) {
                        Text(String(format: "%.2f", getPercentageChange(stockData: downloadManager.dailyEntries)) + "%")
                            .font(.custom("Avenir", size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(getPercentageChange(stockData: downloadManager.dailyEntries) < 0 ? .red : .green)
                        Text("$" + String(format: "%.2f", downloadManager.dataEntries.last?.close ?? 0))
                            .font(.custom("Avenir", size: 26))
                    }
                }
            }
        }
    }
}
