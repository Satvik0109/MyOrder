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
    
    private let COFFEE_TYPES = ["Original Blend", "Dark Roast", "French Vanilla"]
    private let COFFEE_SIZES = ["Small", "Medium", "Large"]
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section{
                        Picker("Coffee Type", selection: self.$cType, content: {
                            ForEach(COFFEE_TYPES, id: \.self, content: { type in
                                Text(type)
                            })
                        })
                    }//Section
                    Section{
                        Picker("Size", selection: self.$cSize, content: {
                            ForEach(COFFEE_SIZES, id: \.self, content: { size in
                                Text(size)
                            })
                        })
                    }//Section
                    TextField("Quantity", text:self.$cQty)
                        .keyboardType(.decimalPad)
                }//Form
                
                Button(action:{
                    self.addOrder()
                }){
                    Text("Add Order")
                }
                .alert(isPresented: $showErrorAlert){
                    Alert(
                        title: Text("Error"),
                        message: Text(self.alertMessage),
                        dismissButton: .default(Text("Try Again"))
                    )
                }
                
                //BUTTON TO NAVIGATE TO ORDERLIST
                
            }//VStack
            .navigationBarTitle("My Order App", displayMode: .inline)
            //.onDisappear(){self.myOrderHelper.getAllOrders()}
        }//Navigation View
    }//View
    private func addOrder(){
        if(self.cType.isEmpty || self.cType.isEmpty || self.cQty.isEmpty){
            self.alertMessage = "No Fields Should Be Left Empty"
            self.showErrorAlert = true
        }
        self.myOrderHelper.insertTask(order: Order(oType: self.cType,oSize: self.cSize, oQty: self.cQty))
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
