import SwiftUI

struct MessageSettingsViewControllerScreenView: View {
    @StateObject private var viewModel = MessageSettingsViewModel.make()
    // ONENATIVE-REVIEW (confidence: low): Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
    var snackbar: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
    var scope: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
    var uriHandler: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
    var focusManager: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val tableViewSelected = remember { PublishRelay<Any?>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewSelected` are at least declared; replace its type and add the real logic manually.
    var tableViewSelected: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val backupOrRestoreActionRelay = remember { PublishRelay<BackupOrRestoreActionEnum>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `backupOrRestoreActionRelay` are at least declared; replace its type and add the real logic manually.
    var backupOrRestoreActionRelay: Any?
    @State private var tableViewSections = emptyList()
    // ONENATIVE-REVIEW (confidence: low): Local value `val viewDidAppearEvent = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `viewDidAppearEvent` are at least declared; replace its type and add the real logic manually.
    var viewDidAppearEvent: Any?
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        VStack {
            VStack(Modifier.padding(padding)) {
                List {
                    tableViewSections()
                    // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                    // .value.forEach { section ->
                    //                     val sectionInfo = section.model as? MessageSettingSection
                    //                     val header = sectionInfo?.header
                    //                     if (!header.isNullOrEmpty()) item { Text(header, modifier = Modifier.padding(16.dp), style = MaterialTheme.typography.labelLarge) }
                    //                     items(section.items) { item -> tableViewRow(item, onSelect = { tableViewSelected.accept(it) }) }
                    //                     val footer = sectionInfo?.footer
                    //                     if (!footer.isNullOrEmpty()) item { Text(footer, modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp), style = MaterialTheme.typography.bodySmall) }
                    //                 }
                    EmptyView()
                }
            }
        }
            .task {
                let actions = Pair(emptyFlow<Nothing>(), emptyFlow<Nothing>())
        let output = viewModel.transform(input: MessageSettingsViewModel.Input(itemSelected: tableViewSelected.asObservable().filterIsInstance<MessageSettingItem>().asDriver(), deviceToken: Client.shared.deviceToken.asDriver(), backupAction: actions.first, restoreAction: actions.second, viewDidAppear: viewDidAppearEvent.asDriver().map { Unit }, archiveSettingRelay: ArchiveSettingRelay.shared.isArchiveRelay))
        // declined: it uses the controller's own member `headers`, which the screen does not have
        output.settings.onEach { tableViewSections.accept($0) }.launchIn(this)
        output.openUrl.onEach { url in uriHandler.openSafe(url.toString()) }.launchIn(this)
        output.copyDeviceToken.onEach { deviceToken in
            Clipboard.text = deviceToken
            Task { snackbar.showSnackbar("Copy".localized) }
        }.launchIn(this)
        // declined: the implicit member `.skipsSubdirectoryDescendants` (no single enum in the project declares it)
        kotlinx.coroutines.yield()
        viewDidAppearEvent.accept(Unit)
            }
    }
}
