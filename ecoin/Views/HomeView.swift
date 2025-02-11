import SwiftUI

struct HomeView: View {
    var logout: () -> Void

    var body: some View {
        VStack {
            Text("Welcome! You are logged in.")
            Button("Log Out", action: logout)
        }
    }
}