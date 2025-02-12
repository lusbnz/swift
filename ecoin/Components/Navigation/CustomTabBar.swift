import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            TabButton(icon: "house.fill", title: "Home", tab: .home, selectedTab: $selectedTab)
            TabButton(icon: "gift.fill", title: "Promo", tab: .promo, selectedTab: $selectedTab)
            
            Button(action: {
                selectedTab = .qrscan
            }) {
                VStack {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Circle().fill(Color.primaryColor))
                        .shadow(radius: 5)
                    Text("QR Scan")
                        .font(.caption)
                        .foregroundColor(.primaryColor)
                }
            }
            .offset(y: -20)

            TabButton(icon: "arrow.triangle.2.circlepath", title: "History", tab: .dashboard, selectedTab: $selectedTab)
            TabButton(icon: "person.fill", title: "Me", tab: .me, selectedTab: $selectedTab)
        }
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .frame(maxWidth: .infinity)
    }
}
