import SwiftUI

class AuthUIState: ObservableObject {
    @Published var animate: Bool = false
    @Published var offsetY: CGFloat = UIScreen.main.bounds.height
}
