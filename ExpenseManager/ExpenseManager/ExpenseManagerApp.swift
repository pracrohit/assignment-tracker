import SwiftUI

@main
struct ExpenseManagerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
