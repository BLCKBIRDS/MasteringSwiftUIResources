//
//  DetailRow.swift
//  C2FoodDeliveryP1
//
//  Created by Andreas Schultz on 28.09.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct DetailRow: View {
    
    var food: Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .padding(.top, 10)
                Text("\(food.price, specifier: "%2.2f") $")
                    .font(.caption)
            }
            Button(action: {print("Order received.")}) {
                Text("ORDER")
                    .foregroundColor(.white)
            }
                .frame(width: 80, height: 50)
                .background(Color.orange)
                .cornerRadius(10.0)
        }
            .padding(20)
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(food: foodData[0])
    }
}
