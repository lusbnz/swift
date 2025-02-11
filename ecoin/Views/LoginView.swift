import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Đăng nhập")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            TextField("Email", text: $authViewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding(.horizontal, 15)
                .padding(.bottom, 5)

            SecureField("Mật khẩu", text: $authViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if !authViewModel.errorMessage.isEmpty {
                Text(authViewModel.errorMessage)
                    .foregroundColor(.red)
            }

            HStack {
                Button("Quên mật khẩu?") {}
                    .foregroundColor(.blue)
                    .padding(.leading)
                    Spacer()
            }

            Button("Đăng nhập", action: authViewModel.login)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()

            NavigationLink("Chưa có tài khoản? Đăng ký", destination: RegisterView())
                .padding(.top, 10)
        }
        .padding()
    }
}
