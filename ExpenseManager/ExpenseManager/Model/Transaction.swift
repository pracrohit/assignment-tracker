import Foundation

struct Transaction: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var amount: Double
    var timestamp: Date
}

