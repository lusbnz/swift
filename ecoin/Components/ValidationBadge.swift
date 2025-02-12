import SwiftUI

struct ValidationBadge: View {
    var text: String
    var isValid: Bool
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(isValid ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
            .foregroundColor(isValid ? .green : .gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}