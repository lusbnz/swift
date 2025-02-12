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
            .ignoresSafeArea(.container, edges: .top)

            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
