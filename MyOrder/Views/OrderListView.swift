//
//  OrderListView.swift
//  MyOrder
//
//  Created by Satvik Kathpal on 2021-10-28.
//  991487352

import SwiftUI

struct OrderListView: View {
    
    @State private var selectedIndex : Int = -1
    @State private var selection : Int? = nil
    @EnvironmentObject var myOrderHelper : MyOrderHelper
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom){
                NavigationLink(destination: DetailView(selectedOrderIndex: self.selectedIndex),tag: 1, selection: $selection){}
            }
        }//Navigation View
    }//View
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
