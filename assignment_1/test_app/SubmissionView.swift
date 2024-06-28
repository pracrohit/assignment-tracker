//
//  SubmissionView.swift
//  test_app
//
//  Created by Shreyas Prakash Chavan on 26/06/24.
//

import SwiftUI

struct SubmissionView: View {
    @Binding var showForm: Bool
    @Binding var data: Input
    var body: some View {
        VStack {
            Text("Submission details").bold()
            Spacer()
            Text("Name: " + data.name)
            Text("Email: " + data.email)
            Text("Phone No.: " + data.phone)
            Text("Review: " + data.review)
            Spacer()
            Button("Reset", action: {
                data = Input.init(name: "", email: "", phone: "", review: "Write Your Review Here...")
                showForm = true
            })
        }
    }
}

//#Preview {
//    SubmissionView(data: dummyData)
//}
