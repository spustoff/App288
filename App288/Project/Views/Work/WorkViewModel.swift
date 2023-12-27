//
//  WorkViewModel.swift
//  App288
//
//  Created by IGOR on 21/12/2023.
//

import SwiftUI
import CoreData

final class WorkViewModel: ObservableObject {

    @AppStorage("companies") var companies: [String] = []

    @Published var workCompany: String = ""
    @Published var workStatus: String = ""
    @Published var workFrom: String = ""
    @Published var workTo: String = ""
    
    @Published var taskDays: String = ""
    @Published var taskDescription: String = ""
    @Published var taskLong: String = ""
    @Published var taskName: String = ""
    @Published var taskTime: String = ""
    @Published var currentCompany: String = ""
    
    @Published var works: [WorksModel] = []
    @Published var isDetail: Bool = false

    func addWork(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "WorksModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "WorksModel", into: context) as! WorksModel
        
        sub.workCompany = workCompany
        sub.workStatus = workStatus
        sub.workFrom = workFrom
        sub.workTo = workTo
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchWorks() {
        
        CoreDataStack.shared.modelName = "WorksModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<WorksModel>(entityName: "WorksModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.works = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.works = []
        }
    }
    
    @Published var tasks: [TasksModel] = []

    func addTask(selectedCompany: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "TasksModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "TasksModel", into: context) as! TasksModel
        
        sub.selectedCompany = selectedCompany
        sub.taskDescription = taskDescription
        sub.taskDays = Int16(Int(taskDays) ?? 0)
        sub.taskLong = taskLong
        sub.taskName = taskName
        sub.taskTime = taskTime
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchTasks() {
        
        CoreDataStack.shared.modelName = "TasksModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TasksModel>(entityName: "TasksModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.tasks = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.tasks = []
        }
    }
}
