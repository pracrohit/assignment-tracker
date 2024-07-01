import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal, 15)

            Button(action: {
                self.text = ""
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Image(systemName: "xmark.circle.fill")
                    .padding(.horizontal, 15)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}
