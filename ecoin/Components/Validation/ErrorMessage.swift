import SwiftUI

struct ErrorMessage: View {
    let message: String
    
    var body: some View {
        if !message.isEmpty {
            Text(message)
                .foregroundColor(.red)
                .font(.subheadline)
                .padding(.top, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
        }
    }
}
