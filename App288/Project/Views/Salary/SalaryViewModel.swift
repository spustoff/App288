//
//  SalaryViewModel.swift
//  App288
//
//  Created by IGOR on 20/12/2023.
//

import SwiftUI
import CoreData

final class SalaryViewModel: ObservableObject {

    @Published var months: [String] = ["Dec", "Jan", "Feb", "Mar", "Apr", "May"]
    @Published var currentMonth = "Dec"
    
    @AppStorage("earned") var earned: Int = 0
    
    @Published var currencies: [String] = ["EUR/USD", "USD/JPY", "AUD/USD", "USD/CHF", "EUR/JPY", "EUR/GBP"]
    @AppStorage("current_currency") var current_currency = ""
    
    @AppStorage("companies") var companies: [String] = []
    
    @Published var currentCompany: String = ""
    @Published var payDate: String = ""
    @Published var payAmount: String = ""
    
    @Published var payments: [PaymentsModel] = []
    @Published var isDetail: Bool = false

    func addPayment(payCompany: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "PaymentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "PaymentsModel", into: context) as! PaymentsModel
        
        sub.payCompany = payCompany
        sub.payDate = payDate
        sub.payAmount = Int16(Int(payAmount) ?? 0)
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchPayments() {
        
        CoreDataStack.shared.modelName = "PaymentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PaymentsModel>(entityName: "PaymentsModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.payments = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.payments = []
        }
    }
}

