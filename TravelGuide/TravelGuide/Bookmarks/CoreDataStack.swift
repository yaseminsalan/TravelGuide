//
//  CoreDataStack.swift
//  TravelGuide
//
//  Created by amarenasoftware on 4.10.2022.
//

import Foundation
import CoreData

class CoreDataStack{
    
    private let modelName:String
    init(modelName: String) {
        self.modelName = modelName
    }
    //We have defined layz to be created once, we do not need to create it continuously.
    //we created a container
    private lazy var storeContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores{_, error in
            if let error = error{
                print("unsuccesfull container loading...\(error.localizedDescription)")
            }
    }
        return container
    }()
    //data will be accessed through the container. We need a managedObjectContext to access them
    lazy var managedContext:NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext(){
        //if there is a change we save, if there is no change we do not save
        guard managedContext.hasChanges else{
            return
        }
        
        do{
          
            try managedContext.save()
            print("kayıt başarılı")
        }catch let error as NSError{
            print("unresolved error\(error)")
        }
        
    }
  
    
}
