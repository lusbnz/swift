import SwiftUI

struct TabButton: View {
    let icon: String
    let tab: Tab
    @Binding var selectedTab: Tab

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(selectedTab == tab ? .primaryColor : .gray)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
        }
    }
}
