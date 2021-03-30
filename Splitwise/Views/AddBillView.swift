import SwiftUI

struct AddBillView: View {
    @State var billName: String = ""
    @State var billDescription: String = ""
    @State var billCantidad: String = ""
    @State var billMoneda: String = "₡ colones"
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var coreDataVM = CoreDataViewModel()
    
    
    let monedas = ["₡ colones","$ dolares"]
    
    var body: some View {
        VStack{
           Form{
                Text("Nombre:")
                TextField("Digite el nombre aqui", text: $billName)
                Text("Monto:")
                TextField("Digite el monto aqui", text: $billCantidad)
                Text("Descripcion:")
                TextEditor(text: $billDescription)
                Picker("Moneda", selection: $billMoneda){
                    ForEach(monedas, id: \.self){ text in
                Text(text) }
                }
            }
            Button(action: Save){
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("Guardar cuenta ")
                }
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color.orange)
            .cornerRadius(15.0)
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                VStack{
                    Text("Agregar Cuenta")
                        .padding().font(.title2).foregroundColor(Color.orange)
                   
                }
            }
        }
    }
    
    func Save(){
        //self.presentationMode.wrappedValue.dismiss()
        self.coreDataVM.saveTask(nombre: billName, descripcion: billDescription, moneda: billMoneda, cantidad: billCantidad)
    }
        
}

struct AddBillView_Previews: PreviewProvider {
    static var previews: some View {
        AddBillView()
    }
}

