//
//  ContentView.swift
//  Shared
//
//  Created by Satvik Kathpal on 2021-10-26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var myOrderHelper : MyOrderHelper
    @State private var cType: String = ""
    @State private var cSize: String = ""
    @State private var cQty: String = ""
    @State private var showErrorAlert: Bool = false
    @State private var alertMessage: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor = "Red" // <1>
    
    var body: some View {
        VStack{
            Form{
                TextField("Quantity", text:self.$cQty)
                Picker("Favorite Color", selection: $selectedColor, content: {
                                ForEach(colors, id: \.self, content: { color in
                                    Text(color)
                                })
                            })
                Text("Selected color: \(selectedColor)")
            }//Form
        }//VStack
    }//View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
