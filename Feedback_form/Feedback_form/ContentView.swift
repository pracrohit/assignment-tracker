import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var review: String = ""
    @State private var isSubmitted: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("User Information")) {
                        TextField("Name", text: $name)
                        TextField("Phone Number", text: $phoneNumber)
                            .keyboardType(.phonePad)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                    }
                    
                    Section(header: Text("Review")) {
                        TextEditor(text: $review)
                            .frame(height: 150)
                            .border(Color.gray, width: 0.5)
                    }
                }
                
                Button(action: {
                    isSubmitted = true
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .navigationDestination(isPresented: $isSubmitted) {
                    FeedbackDetailsView(name: name, phoneNumber: phoneNumber, email: email, review: review)
                }
            }
            .navigationTitle("Feedback Form")
        }
    }
}

struct FeedbackDetailsView: View {
    var name: String
    var phoneNumber: String
    var email: String
    var review: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("User Information")
                .font(.title)
                .bold()

            HStack {
                Text("Name:")
                    .bold()
                Spacer()
                Text(name)
            }

            HStack {
                Text("Phone Number:")
                    .bold()
                Spacer()
                Text(phoneNumber)
            }

            HStack {
                Text("Email:")
                    .bold()
                Spacer()
                Text(email)
            }

            Text("Review")
                .font(.title)
                .bold()

            Text(review)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle("Feedback Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
