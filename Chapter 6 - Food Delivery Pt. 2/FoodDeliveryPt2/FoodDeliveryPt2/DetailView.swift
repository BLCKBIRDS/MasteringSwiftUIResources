//
//  DetailView.swift
//  FoodDeliveryListSwiftUITutorial
//
//  Created by Andreas Schultz on 09.08.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI


struct DetailView : View {
    
    @State var showOrderSheet = false
    
    var currentCategory: Categories
    
    var body: some View {
        List(filterData(by: currentCategory)) { food in
            DetailRow(showOrderSheet: self.$showOrderSheet, food: food)
        }
            .navigationBarTitle(Text(categoryString(for: currentCategory)), displayMode: .inline)
        .sheet(isPresented: $showOrderSheet) {
            OrderForm(showOrderSheet: self.$showOrderSheet)
        }
    }
}

#if DEBUG
struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        DetailView(currentCategory: .burger)
    }
}
#endif

