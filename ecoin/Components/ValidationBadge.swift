import SwiftUI

struct ValidationBadge: View {
    var text: String
    var isValid: Bool
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(isValid ? Color.primaryColor.opacity(0.3) : Color.gray.opacity(0.2))
            .foregroundColor(isValid ? Color.primaryColor : .gray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .fixedSize(horizontal: true, vertical: false)
    }
}
