import Foundation

class CoreDataViewModel: ObservableObject{
    @Published var coreDM = CoreDataManager()
    @Published var bills: [BillEntity] = [BillEntity]()
    @Published var contacts: [ContactEntity] = [ContactEntity]()
    
    func saveTask(nombre:String, descripcion: String, moneda:String, cantidad: String){
        //Validations
        
        coreDM.saveTask(nombre: nombre, descripcion: descripcion, moneda: moneda, cantidad: cantidad)
    }
    
    func getAllTask(){
        bills = self.coreDM.getAllTask()
    }
    
    func deleteTask(bill:BillEntity){
        //Validations
        coreDM.deleteTask(bill: bill)
    }
    
    func saveContact(nombre:String,numero:String){
        coreDM.saveContact(nombre: nombre, numero: numero)
    }
    
}

