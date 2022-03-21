//
//  Data.swift
//  Сalculator
//
//  Created by Евгений Таракин on 29.11.2021.
//

import Foundation
import CoreData

class DataManager: Hashable {
    
    var tableDatas: [TableData] {
        let fetchRequest: NSFetchRequest<TableData> = TableData.fetchRequest()

        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
            return []
        }
    }
    
    private let context = CoreDataManager().persistentContainer.viewContext

    func saveData(operations: String, resault: String) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TableData", in: context) else {
            return
        }
        
        let historyObject = TableData(entity: entity, insertInto: context)
        historyObject.operations = operations
        historyObject.resault = resault
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteDatas() {
        let fetchRequest: NSFetchRequest<TableData> = TableData.fetchRequest()
        if let objects = try? context.fetch(fetchRequest) {
            for object in objects {
                context.delete(object)
            }
        }
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    let uuid = UUID()
    static func ==(lhs: DataManager, rhs: DataManager) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
}
