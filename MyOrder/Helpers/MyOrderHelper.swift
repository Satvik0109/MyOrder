//
//  MyOrderHelper.swift
//  MyOrder (iOS)
//
//  Created by Satvik Kathpal on 2021-10-26.
//  991487352

import Foundation
import CoreData
import UIKit

class MyOrderHelper: ObservableObject{
    
    @Published var orderList = [OrderMO]()
    
    //singleton instance
    private static var shared : MyOrderHelper?
    
    static func getInstance() -> MyOrderHelper{
        if shared != nil{
            return shared!
        }else{
            shared = MyOrderHelper(context: PersistenceController.preview.container.viewContext)
            return shared!
        }
    }
    
    private let moc : NSManagedObjectContext
    private let ENTITY_NAME = "OrderMO"
    
    init(context: NSManagedObjectContext){
        self.moc = context
    }
    
    func insertTask(order: Order){
        do{
            let orderToBeInserted = NSEntityDescription.insertNewObject(forEntityName: ENTITY_NAME, into: self.moc) as! OrderMO
            
            orderToBeInserted.id = UUID()
            orderToBeInserted.type = order.oType
            orderToBeInserted.size = order.oSize
            orderToBeInserted.quantity = order.oQty
            orderToBeInserted.dateAdded = Date()
            
            if self.moc.hasChanges{
                try self.moc.save()
                print(#function, "Data Saved Successfully")
            }
        }catch let error as NSError{
            print(#function,"Data Save Unsuccessful \(error)")
        }
    }
    
    func getAllOrders(){
        let fetchRequest = NSFetchRequest<OrderMO>(entityName: ENTITY_NAME)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "dateAdded", ascending: false)]  //watch for key error use something else then
        
        do{
            let result = try self.moc.fetch(fetchRequest)
            print(#function, "Number Of Orders Fetched: \(result.count)")
            self.orderList.removeAll()
            self.orderList.insert(contentsOf: result, at: 0)
            
        } catch let error as NSError{
            print(#function,"Could Not Fetch Data \(error)")
        }
    }
    
    private func searchOrder(orderID : UUID) -> OrderMO?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY_NAME)
        let predicateID = NSPredicate(format: "id == %@", orderID as CVarArg)
        fetchRequest.predicate = predicateID
        
        do{
            let result = try self.moc.fetch(fetchRequest)
            if result.count > 0{
                return result.first as? OrderMO
            }
        }catch let error as NSError{
            print(#function,"Unable To Search For Data \(error)")
        }
        return nil
    }
    
    func deleteOrder(orderID: UUID){
        
        let searchResult = self.searchOrder(orderID: orderID)
        
        if(searchResult != nil){
            do{
                self.moc.delete(searchResult!)
                try self.moc.save()
                objectWillChange.send()
                print(#function,"Data Deleted Successfully")
            }catch let error as NSError{
                print(#function,"Data Delete Failed \(error)")
            }
        }else{
            print(#function,"No Matching Record Found")
        }
    }
    
    func updateOrder(updatedOrder: OrderMO){
        
        let searchResult = self.searchOrder(orderID: updatedOrder.id! as UUID)
        
        if(searchResult != nil){
            do{
                let orderToUpdate = searchResult!
                orderToUpdate.quantity = updatedOrder.quantity
                try self.moc.save()
                objectWillChange.send()
                print(#function,"Data Updated Successfully")
            } catch let error as NSError{
                print(#function,"Data Update Failed \(error)")
            }
        }else{
            print(#function,"No Matching Data Found")
        }
    }
}
