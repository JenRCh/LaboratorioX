import SwiftUI

struct ListBillView: View {
    @ObservedObject var coreDataVM = CoreDataViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List{ ForEach(coreDataVM.bills, id: \.self){
                    bill in
                    NavigationLink(
                        destination: BillDetailsView(bill: bill),
                        label:{
                            Label(
                                bill.nombre ?? "No Name",
                                systemImage: priorityImages(moneda: bill.moneda ?? ""))
                        }
                )
                }.onDelete(perform: { indexSet in
                    indexSet.forEach{
                        index in
                        let bill = coreDataVM.bills[index]
                        coreDataVM.deleteTask(bill: bill)
                        coreDataVM.getAllTask()
                    }
                })
                }
                
                NavigationLink(destination:AddBillView()){
                    Text("Agregar cuenta")
                        .padding()
                        .frame(minWidth:0, maxWidth: 300)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(15.0)
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Cuentas por pagar")
            .navigationBarItems(trailing: NavigationLink(
                destination: AddContactView()){
                Image(systemName: "person.crop.circle")
                    .imageScale(.large)
            }
            )
        }.onAppear(perform: {
            self.coreDataVM.getAllTask()
        })
    }
    
    func priorityImages(moneda:String) -> String {
        switch moneda {
        case "₡ colones":
            return "centsign.circle"
        default:
         return "dollarsign.circle"
        }
    }
}

struct ListBillView_Previews: PreviewProvider {
    static var previews: some View {
        ListBillView()
    }
}


