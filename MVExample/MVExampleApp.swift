//
//  MVExampleApp.swift
//  MVExample
//
//  Created by David Adewale on 11/07/2024.
//

import SwiftUI

@main
// USING iOS17 upwards

struct MVExampleApp: App {
    
    @State private var  storeModel: StoreModel?
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if let storeModel = storeModel{
                ContentView()
                    .environment(storeModel)} else {
                        ProgressView("Losding..")
                            .task {
                                await initializeStoreModel()
                            }
                    }
            }
        }
    }
    
    @MainActor
    private func initializeStoreModel() async {
        let webservice = Webservice()
         storeModel = StoreModel(webservice: webservice)
    }

}



 //Using Pre iOS17
/*
struct MVExampleApp: App {
    @StateObject private var storeModel = StoreModel(webservice: Webservice())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storeModel)
        }
    }
}
*/
