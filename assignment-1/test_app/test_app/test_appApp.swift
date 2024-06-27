//
//  test_appApp.swift
//  test_app
//
//  Created by Shreyas Prakash Chavan on 26/06/24.
//

import SwiftUI

struct Input {
    var name: String
    var email: String
    var phone: String
    var review: String
}
@main
struct test_appApp: App {
    @State var showForm: Bool = true
    @State var data: Input = Input.init(name: "", email: "", phone: "", review: "Write Your Review Here...")
    var body: some Scene {
        WindowGroup {
            if showForm {
                ContentView(showForm: $showForm, data: $data)
            }
            else {
                SubmissionView(showForm: $showForm, data: $data)
            }
        }
    }
}
