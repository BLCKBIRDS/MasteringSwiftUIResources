//
//  DetailView.swift
//  C2FoodDeliveryP1
//
//  Created by Andreas Schultz on 28.09.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var currentCategory: Categories
    
    var body: some View {
        List(filterData(by: currentCategory)) { food in
            DetailRow(food: food)
        }
            .navigationBarTitle(Text(categoryString(for: currentCategory)), displayMode: .inline)

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(currentCategory: .burger)
    }
}
