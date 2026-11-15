struct Input {
    let selectServer: Driver<Server>
    let copyServer: Driver<Server>
    let deleteServer: Driver<Server>
    let resetServer: Driver<Pair<Server, String?>>
    let setServerName: Driver<Pair<Server, String?>>
}

struct Output {
    let servers: Driver<List<SectionModel<String, ServerListTableViewCellViewModel>>>
    let showSnackbar: Driver<String>
    let copy: Driver<String>
}

