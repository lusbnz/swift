import SwiftUI

struct CreatePasswordView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @FocusState private var isFocused: Bool
    @State private var animate = false
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height
    @State private var isAgree = false

    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea(edges: .all)
            
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Create Password")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primaryColor)
                    
                    Text("Please enter your new password")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                
                VStack(spacing: 15) {
                    TextField("", text: $authViewModel.password, prompt: Text("Mật khẩu")
                        .foregroundColor(.black))
                        .textInputAutocapitalization(.never)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .foregroundColor(.black)
                        .focused($isFocused)
                    
                    SecureField("", text: $authViewModel.rePassword, prompt: Text("Nhập lại mật khẩu").foregroundColor(.black))
                        .textInputAutocapitalization(.never)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        .foregroundColor(.black)

                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 50)
                
                HStack {
                    Button(action: authViewModel.signUp) {
                        HStack {
                            Spacer()
                            Text("Register")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                ErrorMessage(message: authViewModel.errorMessage)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 10) {
                        ValidationBadge(text: "At least 8 characters", isValid: authViewModel.password.count >= 8)
                        ValidationBadge(text: "One non-letter", isValid: authViewModel.password.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil)
                        ValidationBadge(text: "One digit", isValid: authViewModel.password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.top, 20)
                .padding(.bottom, 150)
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

