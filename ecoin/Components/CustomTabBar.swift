struct CustomTabBar: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            TabButton(icon: "house.fill", tab: .home, selectedTab: $selectedTab)
            TabButton(icon: "tag.fill", tab: .promo, selectedTab: $selectedTab)

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