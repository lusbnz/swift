import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var logout: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Chào mừng!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Bạn đã đăng nhập với email:")
            Text(authViewModel.email)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.blue)

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

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
