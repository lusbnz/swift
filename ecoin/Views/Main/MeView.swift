import SwiftUI

struct MeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    let imageURLs = [
        "https://picsum.photos/180/120",
        "https://picsum.photos/180/120?random=1",
        "https://picsum.photos/180/120?random=2",
        "https://picsum.photos/180/120?random=3",
        "https://picsum.photos/180/120?random=4"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 60, height: 60)
                        
                        VStack(alignment: .leading) {
                            Text("Đinh Quốc Việt")
                                .font(.headline)
                                .foregroundColor(Color.primaryColor)
                            Text("Thành viên Vàng ")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 1)
                
                HStack {
                    Text("873 Điểm tích lũy")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "bitcoinsign.circle")
                        .foregroundColor(.yellow)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 1)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Thông tin chi tiết")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "pencil")
                    }
                    Text("Số điện thoại: 0353580848")
                        .font(.subheadline)
                    Text("Giới tính: Nam")
                        .font(.subheadline)
                    Text("Tuổi: 22")
                        .font(.subheadline)
                    Text("Checkin")
                        .font(.headline)
                        .padding(.top, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(imageURLs, id: \.self) { url in
                                AsyncImage(url: URL(string: url)) { image in
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 180, height: 120)
                                        .cornerRadius(8)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 180, height: 120)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 1)
                
                VStack(spacing: 0) {
                    MenuRow(title: "Mã ưu đãi của tôi", icon: "gift", isFirst: true)
                    MenuRow(title: "Lịch sử hoạt động", icon: "clock")
                    MenuRow(title: "Feedback", icon: "bubble.left")
                    MenuRow(title: "Ngôn ngữ", icon: "globe")
                    MenuRow(title: "Đổi mật khẩu", icon: "lock")
                    MenuRow(title: "Liên hệ hỗ trợ", icon: "phone", isLast: true)
                    
                    Button(action: authViewModel.logout) {
                        Text("Đăng xuất")
                            .foregroundColor(.red)
                            .padding(10)
                            .frame(maxWidth: 200)
                            .cornerRadius(12)
                            .shadow(radius: 1)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                    .padding(.top, 30)
                    .padding(.bottom, 100)
                }
            }
            .padding(.horizontal)
            .padding(.top, 50)
        }
        .background(Color.gray.opacity(0.1))
    }
}
