import SwiftUI

struct NewServerViewControllerScreenView: View {
    @StateObject private var viewModel = NewServerViewModel.make()
    // ONENATIVE-REVIEW (confidence: low): Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
    var snackbar: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
    var scope: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
    var uriHandler: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
    var focusManager: Any?
    @State private var addressTextFieldText = ""
    // ONENATIVE-REVIEW (confidence: low): Local value `val addressTextFieldFocus = remember { FocusRequester() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `addressTextFieldFocus` are at least declared; replace its type and add the real logic manually.
    var addressTextFieldFocus: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val noticeLabelTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `noticeLabelTap` are at least declared; replace its type and add the real logic manually.
    var noticeLabelTap: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val doneButtonTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `doneButtonTap` are at least declared; replace its type and add the real logic manually.
    var doneButtonTap: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val scanButtonTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scanButtonTap` are at least declared; replace its type and add the real logic manually.
    var scanButtonTap: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val viewDidAppearEvent = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `viewDidAppearEvent` are at least declared; replace its type and add the real logic manually.
    var viewDidAppearEvent: Any?
    @State private var addressTextFieldField = androidx.compose.ui.text.input.TextFieldValue(addressTextFieldText.value)
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        VStack {
            Scaffold(snackbarHost: { SnackbarHost(snackbar) }, topBar: {
            TopAppBar(
                title: { Text("AddServer".localized) },
                actions: {
                    IconButton(onClick: { doneButtonTap.accept(Unit) }) {
                        Icon(Icons.Default.Check, contentDescription: nil)
                    }
                },
            )
        }, item: padding) {
                VStack(Modifier.padding(padding).padding(horizontal: 16).verticalScroll(rememberScrollState())) {
                    // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                    // if (addressTextFieldField.text != addressTextFieldText.value) addressTextFieldField = androidx.compose.ui.text.input.TextFieldValue(addressTextFieldText.value, androidx.compose.ui.text.TextRange(addressTextFieldText.value.length))
                    //             OutlinedTextField(
                    //                 value = addressTextFieldField,
                    //                 onValueChange = { addressTextFieldField = it; addressTextFieldText.value = it.text },
                    //                 label = { Text("ServerAddress".localized) },
                    //                 supportingText = { Text("ServerExample".localized) },
                    //                 singleLine = true,
                    //                 modifier = Modifier.fillMaxWidth().focusRequester(addressTextFieldFocus),
                    //             )
                    //             Text("DeploymentDocuments".localized, modifier = Modifier.padding(top = 40.dp).clickable { noticeLabelTap.accept(Unit) }, fontSize = 12.sp, color = MaterialTheme.colorScheme.primary)
                    EmptyView()
                }
            }
        }
            .task {
                let noticeTap = noticeLabelTap.asDriver().map { Unit }.asDriver(Unit)
        let done = doneButtonTap.asDriver().map { addressTextFieldText.value ?? "" }.asDriver()
        let viewDidAppear = viewDidAppearEvent.asDriver().map { Unit }.asDriver()
        // declined: `QRScannerViewController` is a screen this app has not been converted to
        let scannerDidScan = emptyFlow<Nothing>()
        let output = viewModel.transform(input: NewServerViewModel.Input(noticeClick: noticeTap, done: done, viewDidAppear: viewDidAppear, didScan: scannerDidScan))
        output.showKeyboard.onEach { show ->
            if (show) {
                addressTextFieldFocus.requestFocus()
            } else {
                focusManager.clearFocus()
            }
        }.launchIn(this)
        output.notice.onEach { url -> uriHandler.openSafe(url.toString()) }.launchIn(this)
        output.urlText.onEach { addressTextFieldText.accept($0) }.launchIn(this)
        output.pop.onEach { onBack() }.launchIn(this)
        output.showSnackbar.onEach { text -> scope.launch { snackbar.showSnackbar(text) } }.launchIn(this)
        kotlinx.coroutines.yield()
        viewDidAppearEvent.accept(Unit)
            }
    }
}
