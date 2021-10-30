//
//  DetailView.swift
//  MyOrder
//
//  Created by Satvik Kathpal on 2021-10-28.
//  991487352

import SwiftUI

struct DetailView: View {
    let selectedOrderIndex : Int
    @State private var type: String = ""
    @State private var size: String = ""
    @State private var qty: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var myOrderHelper : MyOrderHelper
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Order Details")
                .font(.title)
                .padding(20)
            
            Form{
                TextField("Quantity", text: self.$qty)
            }//Form
            
            Button(action: {
                self.updateOrder()
            }){
                Text("Update Order")
            }
            Spacer()
        }//VStack
        .frame(maxWidth: .infinity)
        .onAppear(){
            self.type = self.myOrderHelper.orderList[selectedOrderIndex].type
            self.size = self.myOrderHelper.orderList[selectedOrderIndex].size
            self.qty = self.myOrderHelper.orderList[selectedOrderIndex].quantity
        }
        .onDisappear(){
            self.myOrderHelper.orderList.removeAll()
            self.myOrderHelper.getAllOrders()
            print(#function, "onDisappear DetailView(): \(self.myOrderHelper.orderList)")
        }
            
    }
    private func updateOrder(){
        self.myOrderHelper.orderList[selectedOrderIndex].type = self.type
        self.myOrderHelper.orderList[selectedOrderIndex].size = self.size
        self.myOrderHelper.orderList[selectedOrderIndex].quantity = self.qty
        
        self.myOrderHelper.updateOrder(updatedOrder: self.myOrderHelper.orderList[selectedOrderIndex])
        self.presentationMode.wrappedValue.dismiss()
    }
}

