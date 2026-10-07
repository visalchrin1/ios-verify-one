struct Input {
    let itemSelected: Driver<MessageSettingItem>
    let deviceToken: Driver<String?>
    let backupAction: Driver<Void>
    let restoreAction: Driver<Data>
    let viewDidAppear: Observable<Void>
    let archiveSettingRelay: BehaviorRelay<Bool>
}

struct Output {
    let settings: Driver<List<SectionModel<MessageSettingSection, MessageSettingItem>>>
    let openUrl: Driver<URL>
    let copyDeviceToken: Driver<String>
    let exportData: Driver<Data>
}

struct label {
    let text: String
}

struct archiveSetting {
    let viewModel: ArchiveSettingCellViewModel
}

struct detail {
    let title: String?
    let text: String?
    let textColor: Any?
    let url: URL?
}

struct backup {
    let viewModel: MutableTextCellViewModel
}

struct deviceToken {
    let viewModel: MutableTextCellViewModel
}

struct spacer {
    let height: Float
    let color: Any?
}

struct donate {
    let title: String
    let productId: String
}

struct MessageSettingSection {
    var header: String? = nil
    var footer: String? = nil
}

