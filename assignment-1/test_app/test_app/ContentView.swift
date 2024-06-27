//
//  ContentView.swift
//  test_app
//
//  Created by Shreyas Prakash Chavan on 26/06/24.
//

import SwiftUI


var dummyData: Input = Input.init(name: "", email: "", phone: "", review: "Write Your Review Here")


struct ContentView: View {
    @Binding var showForm: Bool
    @Binding var data : Input
    var body: some View {
        Form {
            Text("Feedback Form").bold()
            TextField("Name:", text: $data.name)
            TextField("Email:", text: $data.email)
            TextField("Phone No:", text: $data.phone)
            TextEditor(text: $data.review)
            Button("Submit", action: {
                showForm = false
            })
        }
        .padding()
    }
}

//#Preview {
//    ContentView(showForm: $true, data: $dummyData)
//}
