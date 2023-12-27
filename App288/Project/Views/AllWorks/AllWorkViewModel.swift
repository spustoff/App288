//
//  AllWorkViewModel.swift
//  App288
//
//  Created by IGOR on 24/12/2023.
//

import SwiftUI
import CoreData

final class AllWorkViewModel: ObservableObject {

    @Published var activeName: String = ""
    @Published var activePost: String = ""
    @Published var activeAdopted: String = ""
    @Published var activeSalary: String = ""
    @Published var activeWorkFrom: String = ""
    @Published var activeWorkTo: String = ""

    @Published var pastName: String = ""
    @Published var pastPost: String = ""
    @Published var pastAdopted: String = ""
    @Published var pastSalary: String = ""
    @Published var pastWorkFrom: String = ""
    @Published var pastWorkTo: String = ""
    
    @Published var actives: [ActiveModel] = []
    @Published var isDetail: Bool = false

    func addActive(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "ActiveModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "ActiveModel", into: context) as! ActiveModel
        
        sub.activeName = activeName
        sub.activePost = activePost
        sub.activeAdopted = activeAdopted
        sub.activeSalary = activeSalary
        sub.activeWorkFrom = activeWorkFrom
        sub.activeWorkTo = activeWorkTo
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchActive() {
        
        CoreDataStack.shared.modelName = "ActiveModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ActiveModel>(entityName: "ActiveModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.actives = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.actives = []
        }
    }
    
    @Published var pasts: [PastModel] = []

    func addPast(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "PastModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "PastModel", into: context) as! PastModel
        
        sub.pastName = pastName
        sub.pastPost = pastPost
        sub.pastAdopted = pastAdopted
        sub.pastSalary = pastSalary
        sub.pastWorkFrom = pastWorkFrom
        sub.pastWorkTo = pastWorkTo
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchPast() {
        
        CoreDataStack.shared.modelName = "PastModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PastModel>(entityName: "PastModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.pasts = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.pasts = []
        }
    }
}

