import SwiftUI

@main
struct ecoin: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}

extension Color {
    static let primaryColor = Color(red: 36/255, green: 138/255, blue: 61/255)
}
