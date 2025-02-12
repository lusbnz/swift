import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @FocusState private var isFocused: Bool
    @State private var animate = false
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea(edges: .all)
            
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Login to EcoCoin")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primaryColor)
                    
                    Text("Please enter your details to sign in")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                
                VStack(spacing: 15) {
                    TextField("", text: $authViewModel.email, prompt: Text("Email").foregroundColor(.black))
                        .textInputAutocapitalization(.never)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .foregroundColor(.black)
                        .focused($isFocused)
                    
                    SecureField("", text: $authViewModel.password, prompt: Text("Mật khẩu").foregroundColor(.black))
                        .textInputAutocapitalization(.never)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                HStack {
                    Spacer()
                    Button("Forgot Password?") {}
                        .foregroundColor(Color.primaryColor)
                        .font(.subheadline)
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
                HStack {
                    Button(action: authViewModel.login) {
                        HStack {
                            Spacer()
                            Text("Login")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                    }
                    
                    Image(systemName: "faceid")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.primaryColor)
                        .padding(.leading, 20)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                ErrorMessage(message: authViewModel.errorMessage)
                
                Text("or login with")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                HStack(spacing: 15) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 60, height: 60)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 60, height: 60)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 60, height: 60)
                }
                .padding(.bottom, 10)
                
                Text("Dont have an account yet?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                NavigationLink(destination: RegisterView()) {
                    Text("Register")
                        .foregroundColor(Color.primaryColor)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 100)
            }
            .background(Color.white)
            .clipShape(RoundedCornerShape(radius: 30, corners: [.topLeft, .topRight]))
            .offset(y: offsetY)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
            .onAppear {
                isFocused = true
                animate = true
                withAnimation(.easeOut(duration: 0.5)) {
                    offsetY = UIScreen.main.bounds.height * 0.15
                }
            }
        }
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
    }
}
