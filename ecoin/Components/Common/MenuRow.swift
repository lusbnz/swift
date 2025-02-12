import SwiftUI

struct MenuRow: View {
    var title: String
    var icon: String
    var isFirst: Bool = false
    var isLast: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
                .font(.body)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .clipShape(
            RoundedCornerShape(
                radius: 12,
                corners: isFirst ? [.topLeft, .topRight] : isLast ? [.bottomLeft, .bottomRight] : []
            )
        )
        .shadow(radius: 1)
    }
}
