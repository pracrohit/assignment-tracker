import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)

                HStack {
                    Text("Title")
                        .font(.headline)
                    Spacer()
                    Text("Amount")
                        .font(.headline)
                    Spacer()
                    Text("Total Balance")
                        .font(.headline)
                }
                .padding()

                List {
                    ForEach(viewModel.transactions.filter {
                        self.searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(self.searchText)
                    }, id: \.self) { transaction in
                        TransactionRowView(transaction: transaction)
                    }
                }

                Text("Total Balance: \(viewModel.totalBalance, specifier: "%.2f")")
                    .font(.title)
                    .padding()

                HStack {
                    NavigationLink(destination: CreditView(viewModel: CreditViewModel(), mainViewModel: viewModel)) {
                        Text("Credit")
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: DebitView(viewModel: DebitViewModel(), mainViewModel: viewModel)) {
                        Text("Debit")
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Expense Manager")
        }
    }
}
