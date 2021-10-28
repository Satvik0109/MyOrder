//
//  OrderMO.swift
//  MyOrder (iOS)
//
//  Created by Satvik Kathpal on 2021-10-26.
//  991487352

import Foundation
import CoreData

@objc(OrderMO)
final class OrderMO: NSManagedObject{
    @NSManaged var id: UUID?
    @NSManaged var type: String
    @NSManaged var size: String
    @NSManaged var quantity: String
    @NSManaged var dateAdded: Date
}

extension OrderMO{
    func convertToOrder() -> Order{
        Order(oID: id ?? UUID(), oType: type, oSize: size, oQty: quantity)
    }
}
