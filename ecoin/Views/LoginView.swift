import SwiftUI

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var errorMessage: String
    var login: () -> Void

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button("Sign In", action: login)
                .padding()
        }
        .padding()
    }
}