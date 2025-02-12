import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(Tab.home)

                PromoView()
                    .tag(Tab.promo)

                QRScanView()
                    .tag(Tab.qrscan)

                DashboardView()
                    .tag(Tab.dashboard)

                MeView()
                    .tag(Tab.me)
            }

            // Custom Floating Tab Bar
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

// MARK: - Custom Floating Tab Bar
struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            TabButton(icon: "house.fill", tab: .home, selectedTab: $selectedTab)
            TabButton(icon: "tag.fill", tab: .promo, selectedTab: $selectedTab)

            // Floating QRScan Button (Bigger)
            Button(action: {
                selectedTab = .qrscan
            }) {
                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Circle().fill(Color.primaryColor))
                    .shadow(radius: 5)
            }
            .offset(y: -20)

            TabButton(icon: "chart.bar.fill", tab: .dashboard, selectedTab: $selectedTab)
            TabButton(icon: "person.fill", tab: .me, selectedTab: $selectedTab)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .frame(maxWidth: .infinity)
    }
}

// MARK: - TabButton Component
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

// MARK: - Tab Enum
enum Tab {
    case home, promo, qrscan, dashboard, me
}

// MARK: - Dummy Views (Replace with real views)
struct PromoView: View { var body: some View { Text("Promo") } }
struct QRScanView: View { var body: some View { Text("QR Scan") } }
struct DashboardView: View { var body: some View { Text("Dashboard") } }
struct MeView: View { var body: some View { Text("Me") } }
