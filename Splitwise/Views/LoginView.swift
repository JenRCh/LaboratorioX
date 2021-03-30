import SwiftUI

struct LoginView: View {
    
    @State var userName = ""
    @State var password = ""
    @AppStorage("stored_User") var user = "jenni@hotmail.com"
    @AppStorage("stored_Pass") var pass = "1234"
    @AppStorage("status") var logged = false
    
    var body: some View {
        VStack{
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Image("bp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,35)
                .padding(.vertical)
            HStack{
                VStack(alignment: .leading, spacing:12, content:{
                    Text("Login")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.orange)
                    
                    Text("Please sign in to continue")
                        .foregroundColor(Color.black.opacity(0.5))
                })
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding(.leading,15)
            HStack{
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.orange)
                    .frame(width:35)
                TextField("EMAIL", text: $userName)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .background(Color.white.opacity(userName == "" ? 0: 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack{
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.orange)
                    .frame(width: 35)
                SecureField("PASSWORD", text: $password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .background(Color.white.opacity(password == "" ? 0:0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing:15){
                Button(action:authenticateUserPassword, label:{
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .padding(.vertical)
                        .frame(width:UIScreen.main.bounds.width - 150)
                })
                .opacity(userName != "" && password != "" ? 1:0.5)
                .disabled(userName != "" && password != "" ? false:true)
                .background(Color.orange)
                .foregroundColor(Color.white)
            }
            
        }
    }
    
    func authenticateUserPassword(){
        if userName == user && password == pass {
            withAnimation(.easeOut){ logged = true }
           
        }
        else {
            print("User Password Does not match")
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
