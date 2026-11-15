struct Header {
    let text: String
}

struct Footer {
    let text: String
}

struct Disclosure {
    let title: String
    let label: String? = nil
    let target: String? = nil
}

struct Toggle {
    let title: String
    let checked: Bool = false
    let state: String? = nil
}

struct Action {
    let title: String
    let target: String? = nil
}

struct Check {
    let title: String
    let checked: Bool = false
}

struct Input {
    let placeholder: String
}

struct Peer {
    let name: String
    let text: String? = nil
    let label: String? = nil
    let target: String? = nil
}

struct Conditional {
    let row: ItemListRow
    let tests: [Pair<String, Bool>]
}

