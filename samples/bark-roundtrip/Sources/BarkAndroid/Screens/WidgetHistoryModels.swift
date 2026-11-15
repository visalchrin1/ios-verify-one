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
    // ONENATIVE-REVIEW (confidence: low): not translated — an `if`/`when` shape this translator doesn't recognize (only `if (cond) { }` and `when (subject) { }` AS STATEMENTS, not as expressions, are supported). Original Kotlin:
    // return messages.reduce(into = mutableListOf<String>()) { result, message ->
    //                 val group = message.group
    //                 if (group == null) {
    //                     return@reduce
    //                 }
    //                 if (!(!group.isEmpty())) {
    //                     return@reduce
    //                 }
    //                 if (!(!result.contains(group))) {
    //                     return@reduce
    //                 }
    //                 result.append(group)
    //             }
    var availableGroups: [String] {
        fatalError("TODO: port from Kotlin")
    }
}

