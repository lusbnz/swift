import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            if authViewModel.isLoggedIn {
                MainView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            authViewModel.checkAuth()
        }
    }
}
