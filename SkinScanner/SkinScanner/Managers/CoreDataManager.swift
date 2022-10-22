//
//  CoreDataManager.swift
//  SkinScanner
//
//  Created by vivi on 22/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "UserDataModel")
        persistentContainer.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func getAllUserCases() -> [UserCase] {
        let fetchRequest: NSFetchRequest<UserCase> = UserCase.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveCase(result: String){
        let userCase = UserCase(context: persistentContainer.viewContext)
        userCase.result = result
        
        do {
            try persistentContainer.viewContext.save()
            
        } catch {
            print("Failed to save user case \(error)")
        }
    }
}
