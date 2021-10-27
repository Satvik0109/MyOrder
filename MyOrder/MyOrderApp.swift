//
//  MyOrderApp.swift
//  Shared
//
//  Created by Satvik Kathpal on 2021-10-26.
//

import SwiftUI

@main
struct MyOrderApp: App {
    let persistenceController = PersistenceController.shared
    let myOrderHelper = MyOrderHelper(context: PersistenceController.shared.container.viewContext)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(myOrderHelper)
        }
    }
}
