import SwiftUI

struct CheckboxToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? Color.primaryColor : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
