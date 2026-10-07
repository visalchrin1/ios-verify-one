struct WidgetHistoryMessage {
    let id: String
    let group: String?
    let title: String?
    let subtitle: String?
    let body: String?
    let image: String?
    let createDate: Date
}

struct WidgetHistorySnapshot {
    let messages: [WidgetHistoryMessage]

    // from WidgetHistorySnapshot.availableGroups
    var availableGroups: [String] {
        TODO("Port from Swift: availableGroups")
    }
}

