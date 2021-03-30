import SwiftUI

struct AddContactView: View {
    @State var contactName: String = ""
    @State var contactNumber: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var coreDataVM = CoreDataViewModel()
    
    var body: some View {
        VStack{
            Form{
                Text("Nombre:")
                TextField("Digite el nombre aqui", text: $contactName)
                Text("Numero de telefono")
                TextField("Digite el numero de telefono aqui", text: $contactNumber)
            }
            Button(action: Save){
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("Guardar contacto ")
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
                    Text("Agregar Contacto")
                        .padding().font(.title2).foregroundColor(Color.orange)
                }
            }
        }
    }
    
    func Save(){
        self.coreDataVM.saveContact(nombre: contactName, numero: contactNumber)
    }

}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}

