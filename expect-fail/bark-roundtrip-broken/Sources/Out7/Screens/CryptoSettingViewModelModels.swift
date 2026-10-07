struct InitialTuple {
    let algorithmList: [Algorithm]
    let modeList: [String]
    let paddingList: [String]
    let initialFields: CryptoSettingFields?
}

struct Input {
    let algorithmChanged: Driver<String>
    let modeChanged: Driver<String>
    let copyScript: Driver<CryptoSettingFields>
    let done: Driver<CryptoSettingFields>
}

struct Output {
    let initial: Driver<InitialTuple>
    let modeListChanged: Driver<List<String>>
    let paddingListChanged: Driver<List<String>>
    let keyLengthChanged: Driver<Int>
    let showSnackbar: Driver<String>
    let done: Driver<Void>
    let copy: Driver<String>
}

