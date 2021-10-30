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
    @State private var showNewOrderView : Bool = false
    @EnvironmentObject var myOrderHelper : MyOrderHelper
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom){
                NavigationLink(destination: DetailView(selectedOrderIndex: self.selectedIndex),tag: 1, selection: $selection){}
                if(self.myOrderHelper.orderList.count > 0){
                    List{
                        ForEach(self.myOrderHelper.orderList.enumerated().map({$0}), id: \.element.self){ indx, currentOrder in
                            VStack(alignment: .leading){
                                Text("\(currentOrder.quantity)x \(currentOrder.type)")
                                    .fontWeight(.bold)
                                
                                Text("Size: \(currentOrder.size)")
                                    .font(.callout)
                                    .italic()
                            }
                            .onTapGesture{
                                self.selectedIndex = indx
                                self.selection = 1
                                print(#function, "\(self.myOrderHelper.orderList[selectedIndex].type) selected")
                            }
                        }//ForEach
                        .onDelete(perform: { indexSet in
                            for index in indexSet{
                                print(#function, "Order To Delete: \(self.myOrderHelper.orderList[index].type)")
                                self.myOrderHelper.deleteOrder(orderID: self.myOrderHelper.orderList[index].id!)
                                self.myOrderHelper.orderList.remove(at: index)
                            }
                        })//onDelete
                    }//List
                }else{
                    VStack{
                        Text("There Are No Orders Placed Yet.")
                        Spacer()
                    }//VStack
                }//else
                
                Button(action:
                        {
                            print("Adding New Order")
                            //self.showNewOrderView = true
                            ContentView()
                        }){
                    Text("Place An Order")
                }//Button
            }//ZStack
            .navigationBarTitle("Orders", displayMode: .inline)
        }//Navigation View
        .onAppear(){
            self.myOrderHelper.getAllOrders()
        }
    }//View
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
