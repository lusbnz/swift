import SwiftUI

struct TabButton: View {
    let icon: String
    let title: String
    let tab: Tab
    @Binding var selectedTab: Tab

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(selectedTab == tab ? Color.primaryColor : .gray)
                Text(title)
                    .font(.caption)
                    .foregroundColor(selectedTab == tab ? Color.primaryColor : .gray)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
        }
    }
}
