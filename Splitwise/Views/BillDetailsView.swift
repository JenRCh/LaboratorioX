import SwiftUI

struct BillDetailsView: View {
    
    let bill: BillEntity
    
    var body: some View {
        VStack{
            Form{
                Text("Contacto:").bold()
                Text(bill.nombre ?? "")
                Text("Monto:").bold()
                Text(bill.cantidad ?? "")
                Text("Description").bold()
                Text(bill.descripcion ?? "")
                    .frame(width:100, height: 300, alignment:.center)
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    VStack{
                        Text("Detalles de Cuenta")
                            .padding().font(.title2).foregroundColor(Color.orange)
                    }
                }
            }
        }
    }
}

struct BillDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let Bill = BillEntity()
        BillDetailsView(bill: Bill)
    }
}

