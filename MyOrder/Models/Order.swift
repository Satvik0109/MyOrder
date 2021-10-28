//
//  Order.swift
//  MyOrder (iOS)
//
//  Created by Satvik Kathpal on 2021-10-26.
//  991487352

import Foundation

struct Order : Identifiable, Hashable{
    
    var id = UUID()
    var oType: String = ""
    var oSize: String = ""
    var oQty: String = ""
    
    init(){
    }
    
    init(oType: String, oSize: String, oQty: String){
        
        self.oType = oType
        self.oSize = oSize
        self.oQty = oQty
    }
    
    init(oID:UUID, oType: String, oSize: String, oQty: String){
        
        self.id = oID
        self.oType = oType
        self.oSize = oSize
        self.oQty = oQty
    }
}

