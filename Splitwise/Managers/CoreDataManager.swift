import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer : NSPersistentContainer
    let persistentContainer1 : NSPersistentContainer
    
    init(){
        //Which file should the container use: In this case TaskDataModel
        persistentContainer = NSPersistentContainer(name: "BillDataModel")
        persistentContainer.loadPersistentStores{
            (description,error) in
            if let error = error {
                print("Unable to load Core Date Store\(error)")
            }
        }
        
        persistentContainer1 = NSPersistentContainer(name: "ContactDataModel")
        persistentContainer1.loadPersistentStores{
            (descripcion,error) in
            if let error = error {
                print("Unable to load Core Date Store\(error)")
            }
        }
        
    }
    
    func saveTask(nombre:String, descripcion: String, moneda:String, cantidad: String){
        let bill = BillEntity(context: persistentContainer.viewContext)
        bill.nombre = nombre
        bill.descripcion = descripcion
        bill.moneda = moneda
        bill.cantidad = cantidad
        
        if let result = try? persistentContainer.viewContext.save(){
            print("Success to save task")
        } else{
            print("Failed to save task")
        }
    }
    
    func getAllTask() -> [BillEntity]{
        let fetchRequest: NSFetchRequest<BillEntity> = BillEntity.fetchRequest()
        
        if let result = try? persistentContainer.viewContext.fetch(fetchRequest){
            print("Success to retrieve all tasks")
            return result
        }
        print ("Failed to retrieve all tasks")
        return[]
    }
    
    func deleteTask(bill: BillEntity){
        persistentContainer.viewContext.delete(bill)
        
        if let result = try? persistentContainer.viewContext.save(){
            print("Success to delete task")
        }else{
            persistentContainer.viewContext.rollback()
            print("Failed to delete task")
        }
    }
    
    func saveContact(nombre:String, numero: String){
        let contact = ContactEntity(context: persistentContainer1.viewContext)
        contact.nombre = nombre
        contact.numero = numero

        if let result = try? persistentContainer1.viewContext.save(){
            print("Success to save task")
        } else{
            print("Failed to save task")
        }
    }
    
}

