import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var logout: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Chào mừng!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Button(action: logout) {
                Text("Đăng xuất")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}
