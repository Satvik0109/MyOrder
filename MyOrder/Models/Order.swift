//
//  Order.swift
//  MyOrder (iOS)
//
//  Created by Satvik Kathpal on 2021-10-26.
//  991487352

import Foundation

struct Order : Identifiable, Hashable{
    
    enum CoffeeType {
        case Original
        case Dark
        case French
    }
    
    enum CoffeeSize {
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
    
    init(oType: CoffeeType, oSize: CoffeeSize, oQty: Int){
        
        switch oType {
        case .Original:
            self.oType = "Original Blend"
        case .Dark:
            self.oType = "Dark Roast"
        case .French:
            self.oType = "French Vanilla"
        }
        
        switch oSize {
        case .Small:
            self.oSize = "Small"
        case .Medium:
            self.oSize = "Medium"
        case .Large:
            self.oSize = "Large"
        }
        
        self.oQty = oQty
    }
    
    init(oid: UUID, oType: CoffeeType, oSize: CoffeeSize, oQty: Int){
        
        self.id = oid
        
        switch oType {
        case .Original:
            self.oType = "Original Blend"
        case .Dark:
            self.oType = "Dark Roast"
        case .French:
            self.oType = "French Vanilla"
        }
        
        switch oSize {
        case .Small:
            self.oSize = "Small"
        case .Medium:
            self.oSize = "Medium"
        case .Large:
            self.oSize = "Large"
        }
        
        self.oQty = oQty
    }
    
    
}

