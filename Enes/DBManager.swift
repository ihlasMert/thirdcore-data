//
//  DBManager.swift
//  Enes
//
//  Created by ihlas on 21.01.2022.
//

import Foundation
import CoreData

class DBManager{
    static let share = DBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Enes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    func saveContext () {
      
        if context.hasChanges {
            do {
                try context.save()
            } catch {
            
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchStudent() -> [Students]{
        var student = [Students]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Students.description())
        do{
            student = try context.fetch(fetchRequest) as! [Students]
        }catch{
            print("fetching Error")
        }
        return student
    }
    
}
