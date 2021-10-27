//
//  Order.swift
//  MyOrder (iOS)
//
//  Created by Satvik Kathpal on 2021-10-26.
//  991487352

import Foundation

struct Order : Identifiable, Hashable{
    
    enum oType {
        case Original
        case Dark
        case French
    }
    
    enum oSize{
        case Small
        case Medium
        case Large
    }
    
    var id = UUID()
    var oType: String = ""
    var oSize: String = ""
    var oQty: Int = 0
    
    init(){
    }
    
    init(oType: String, oSize: String, oQty: Int){
        
        self.oType = oType
        self.oSize = oSize
        self.oQty = oQty
    }
    
    init(oID:UUID, oType: String, oSize: String, oQty: Int){
        
        self.id = oID
        self.oType = oType
        self.oSize = oSize
        self.oQty = oQty
    }
}

