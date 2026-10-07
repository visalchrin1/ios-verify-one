struct Input {
    let noticeClick: Driver<Void>
    let done: Driver<String>
    let viewDidAppear: Driver<Void>
    let didScan: Driver<String>
}

struct Output {
    let showKeyboard: Driver<Bool>
    let notice: Driver<URL>
    let urlText: Driver<String>
    let showSnackbar: Driver<String>
    let pop: Driver<String>
}

