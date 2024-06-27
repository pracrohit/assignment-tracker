import SwiftUI

struct DetailView: View {
    var firstname: String
    var phone: String
    var email: String
    var review: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Username: \(firstname)")
                .font(.headline)
            Text("Phone: \(phone)")
                .font(.subheadline)
            Text("Email: \(email)")
                .font(.subheadline)
            Text("Review: \(review)")
                .font(.body)
        }
        .navigationTitle("Feedback Details")
        .padding()
    }
}


struct ContentView: View {
    @State var firstname = ""
    @State var phone = ""
    @State var email = ""
    @State var review = ""
    @State private var showDetailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Username", text: $firstname)
                        TextField("Phone no", text: $phone)
                        TextField("Email", text: $email)
                        TextField("Review", text: $review)
                    }
                    Section {
                        NavigationLink(destination: DetailView(firstname: firstname, phone: phone, email: email, review: review), isActive: $showDetailView) {
                            Button(action: {
                                showDetailView = true
                            }, label: {
                                Text("Submit")
                            })
                        }
                    }
                }
                .navigationTitle("Feedback Form")
            }
        }
    }
}

#Preview {
    ContentView()
}
