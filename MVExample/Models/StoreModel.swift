//
//  StoreModel.swift
//  MVExample
//
//  Created by David Adewale on 11/07/2024.
//

import Foundation

//The purpose of this model is to direct the flow

//iOS 17 Upwards

 @MainActor
 @Observable class StoreModel {
     let webservice: Webservice
     var products: [Product] = []
 
     init(webservice: Webservice){
         self.webservice = webservice
     }
 
     func populateProduct() async throws {
         products = try await webservice.getProducts()
 
     }
 
 }


/*
//pre iOS17
@MainActor

class StoreModel: ObservableObject {
    let webservice: Webservice
    @Published var products: [Product] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProduct() async throws {
        products = try await webservice.getProducts()
    }
}
*/
