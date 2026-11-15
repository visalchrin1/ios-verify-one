import SwiftUI

struct MessageListViewControllerScreenView: View {
    @StateObject private var viewModel = MessageListViewModel.make()
    // ONENATIVE-REVIEW (confidence: low): Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
    var snackbar: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
    var scope: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
    var uriHandler: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
    var focusManager: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val tableViewDeleted = remember { PublishRelay<Any?>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewDeleted` are at least declared; replace its type and add the real logic manually.
    var tableViewDeleted: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val tableViewLoadMore = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewLoadMore` are at least declared; replace its type and add the real logic manually.
    var tableViewLoadMore: Any?
    @State private var searchBarText = ""
    @State private var screenTitle = ""
    // ONENATIVE-REVIEW (confidence: low): Local value `val itemDeleteInGroupRelay = remember { PublishRelay<MessageItemModel>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `itemDeleteInGroupRelay` are at least declared; replace its type and add the real logic manually.
    var itemDeleteInGroupRelay: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val refreshRelay = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `refreshRelay` are at least declared; replace its type and add the real logic manually.
    var refreshRelay: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val initialLoadRelay = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `initialLoadRelay` are at least declared; replace its type and add the real logic manually.
    var initialLoadRelay: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val reloadRelay = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `reloadRelay` are at least declared; replace its type and add the real logic manually.
    var reloadRelay: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val clearRelay = remember { PublishRelay<MessageDeleteTimeRange>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clearRelay` are at least declared; replace its type and add the real logic manually.
    var clearRelay: Any?
    @State private var tableViewSections = emptyList()
    // ONENATIVE-REVIEW (confidence: low): Local value `val listState = androidx.compose.foundation.lazy.rememberLazyListState()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `listState` are at least declared; replace its type and add the real logic manually.
    var listState: Any?
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        VStack {
            VStack(Modifier.padding(padding)) {
                TextField("", text: $searchBarText.value)
                    .frame(maxWidth: .infinity)
                    .padding(horizontal: 16, vertical: 8)
                List {
                    tableViewSections()
                    // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                    // .value.forEach { section ->
                    //                     items((section as MessageSection).messages) { item -> tableViewRow(item, onDelete = { tableViewDeleted.accept(it) }, onSelect = {  }) }
                    //                 }
                    EmptyView()
                }
            }
                .onChange(of: listState) {
                    snapshotFlow { (listState.layoutInfo.visibleItemsInfo.lastOrNull()?.index ?? -1) to listState.layoutInfo.totalItemsCount }
                    .filter { (last, total) -> total > 0 && last >= total - 2 }
                    .distinctUntilChanged()
                    .collect { tableViewLoadMore.accept(Unit) }
                }
        }
            .task {
                let output = viewModel.transform(input: MessageListViewModel.Input(initialLoad: initialLoadRelay.asDriver(), refresh: refreshRelay.asDriver(), loadMore: tableViewLoadMore.asObservable().asDriver(), itemDelete: tableViewDeleted.asObservable().filterIsInstance<MessageListCellItem>().asDriver(), itemDeleteInGroup: itemDeleteInGroupRelay.asDriver(), delete: clearRelay.asDriver(), groupToggleTap: emptyFlow(), searchText: snapshotFlow { searchBarText.value as! String? }.asObservable(), reload: reloadRelay.asDriver()))
        // declined: `tableView.rx.refreshAction` has no Compose counterpart yet
        output.messages.onEach { tableViewSections.accept($0) }.launchIn(this)
        // declined: it uses the controller's own member `finishInitialLoadingTransition`, which the screen does not have
        // declined: `groupButton.customView` is a UIKit bar button view, which has no Compose counterpart
        output.title.onEach { screenTitle.accept($0) }.launchIn(this)
        // declined: it uses the controller's own member `finishInitialLoadingTransition`, which the screen does not have
        // declined: it uses `navigationItem`, which has no Android counterpart in this project
        this.launch { kotlinx.coroutines.withContext(kotlinx.coroutines.Dispatchers.Main) { initialLoadRelay.accept(Unit) } }
            }
    }
}
