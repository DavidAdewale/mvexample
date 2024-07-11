//
//  ContentView.swift
//  MVExample
//
//  Created by David Adewale on 11/07/2024.
//

import SwiftUI

struct ContentView: View {
    //pre iOS17
//    @EnvironmentObject private var storeModel: StoreModel
    
    @Environment(StoreModel.self) private var storeModel: StoreModel
    
    private func populateProducts() async {
        do {
            try await storeModel.populateProduct()
        } catch {
            print(error)
        }
    }
    
    
    var body: some View {
        VStack {
            List(storeModel.products) { product in
                HStack {
                    Text(product.title)
                    Spacer()
                    Text(product.price as NSNumber, formatter: NumberFormatter.currency)
                }
            }
        }
        .task {
            await populateProducts()
        }.navigationTitle("Products")
    }
}

//Pre iOS17
/*
 #Preview {
 ContentView()
 .environmentObject(StoreModel(webservice: Webservice()))
 }
 */

//iOS 17+
#Preview {
    NavigationStack{
        ContentView()
            .environment(StoreModel(webservice: Webservice()))
    }
}
