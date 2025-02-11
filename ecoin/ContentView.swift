import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            if authViewModel.isLoggedIn {
                HomeView(logout: authViewModel.logout)
            } else {
                LoginView()
            }
        }
        .onAppear {
            authViewModel.checkAuth()
        }
    }
}
