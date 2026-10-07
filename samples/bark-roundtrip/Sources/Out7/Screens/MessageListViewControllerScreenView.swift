import SwiftUI

struct MessageListViewControllerScreenView: View {
    // ONENATIVE-REVIEW (confidence: low): Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
    var scope: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
    var snackbar: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
    var clipboard: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val pageCount = 20` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `pageCount` are at least declared; replace its type and add the real logic manually.
    var pageCount: Any?
    @State private var version = 0
    @State private var search = ""
    @State private var groupedMode = AppStorage.settings.getString("me.fin.messageListType") == "group"
    @State private var filterGroup: Pair<String?, Bool>? = nil
    @State private var pages = 1
    @State private var expandedGroups = setOf<String>()
    @State private var menuOpen = false
    @State private var moreOpen = false
    // ONENATIVE-REVIEW (confidence: low): Local value `val lifecycleOwner = androidx.lifecycle.compose.LocalLifecycleOwner.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `lifecycleOwner` are at least declared; replace its type and add the real logic manually.
    var lifecycleOwner: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val all = remember(version) { HistoryMessageStore.all() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `all` are at least declared; replace its type and add the real logic manually.
    var all: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val filtered = all.filter { m ->
    //         (filterGroup == null || m.group == filterGroup!!.first) &&
    //             (search.isEmpty() || listOf(m.title, m.subtitle, m.body).any { it?.contains(search, ignoreCase = true) == true })
    //     }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `filtered` are at least declared; replace its type and add the real logic manually.
    var filtered: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val asList = filterGroup != null || !groupedMode || search.isNotEmpty()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `asList` are at least declared; replace its type and add the real logic manually.
    var asList: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val rows: List<Row_> = if (asList) filtered.map { Row_.Single(it) } else {
    //         filtered.map { it.group }.distinct().mapNotNull { g ->
    //             val ms = filtered.filter { it.group == g }
    //             when {
    //                 ms.size == 1 -> Row_.Single(ms[0])
    //                 ms.isNotEmpty() -> Row_.Group(g ?: "default".localized, g, ms.size, ms.take(5))
    //                 else -> null
    //             }
    //         }
    //     }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `rows` are at least declared; replace its type and add the real logic manually.
    var rows: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val visible = rows.take(pages * pageCount)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `visible` are at least declared; replace its type and add the real logic manually.
    var visible: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val listState = rememberLazyListState()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `listState` are at least declared; replace its type and add the real logic manually.
    var listState: Any?
    // ONENATIVE-REVIEW (confidence: low): Local delegate `val nearEnd by remember { derivedStateOf { val last = listState.layoutInfo.visibleItemsInfo.lastOrNull()?.index ?: 0; last >= visible.size - 2 && visible.size < rows.size } }` was not translated as a real binding — only `by remember { mutableStateOf(...) }}` (or its mutableIntStateOf/mutableLongStateOf/mutableFloatStateOf/mutableDoubleStateOf primitive variants) state round-trips to @State — a placeholder property was declared below so this screen's existing references to `nearEnd` are at least declared; replace its type and add the real delegate logic manually.
    var nearEnd: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val sheet = UIAlertController(null, null, UIAlertControllerStyle.ActionSheet)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `sheet` are at least declared; replace its type and add the real logic manually.
    var sheet: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val alert = UIAlertController(null, "${"clearFrom".localized}\n${range.label}", UIAlertControllerStyle.Alert)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `alert` are at least declared; replace its type and add the real logic manually.
    var alert: Any?
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        VStack {
            // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
            // DisposableEffect(lifecycleOwner) {
            //         val observer = androidx.lifecycle.LifecycleEventObserver { _, event -> if (event == androidx.lifecycle.Lifecycle.Event.ON_RESUME) version++ }
            //         lifecycleOwner.lifecycle.addObserver(observer)
            //         onDispose { lifecycleOwner.lifecycle.removeObserver(observer) }
            //     }
            EmptyView()
            fun()
            toast(text: String) {
                scope()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .launch { snackbar.showSnackbar(text) }
                EmptyView()
            }
            fun()
            delete(ids: Collection<String>) {
                HistoryMessageStore()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .remove(ids); version++
                EmptyView()
            }
            fun()
            showMessageActions(message: HistoryMessage) {
                sheet()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .addAction(UIAlertAction("Copy2".localized) {
                //             clipboard.setText(AnnotatedString(listOfNotNull(message.title, message.subtitle, message.body, message.url).filter { it.isNotEmpty() }.joinToString("\n")))
                //             toast("Copy".localized)
                //         })
                //         sheet.addAction(UIAlertAction("removeMessage".localized, UIAlertActionStyle.Destructive) { delete(listOf(message.id)) })
                //         sheet.addAction(UIAlertAction("Cancel".localized, UIAlertActionStyle.Cancel))
                //         UiAlerts.present(sheet)
                EmptyView()
            }
            fun()
            clearAlert(range: ClearRange) {
                alert()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .addAction(UIAlertAction("clear".localized, UIAlertActionStyle.Destructive) {
                //             HistoryMessageStore.removeWhere { range.matches(it.createDate) && (filterGroup == null || it.group == filterGroup!!.first) }
                //             version++
                //         })
                //         alert.addAction(UIAlertAction("Cancel".localized, UIAlertActionStyle.Cancel))
                //         UiAlerts.present(alert)
                EmptyView()
            }
            ZStack(Modifier.fillMaxSize().background(AssetColors.background.ResolveView())) {
                VStack(Modifier.fillMaxSize()) {
                    HStack(Modifier.fillMaxWidth().padding(start: if (filterGroup != nil) 4 else 20, end: 4, top: 48, bottom: 4), verticalAlignment: Alignment.CenterVertically) {
                        // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                        // if (filterGroup != null) IconButton(onClick = { filterGroup = null }) { Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = null, tint = AssetColors.grey_darken4.resolve()) }
                        //                 Text(
                        //                     if (filterGroup != null) (filterGroup!!.first ?: "default".localized) else "historyMessage".localized,
                        //                     Modifier.weight(1f), style = MaterialTheme.typography.headlineMedium, fontWeight = FontWeight.Bold, color = AssetColors.grey_darken4.resolve(), maxLines = 1,
                        //                 )
                        //                 if (filterGroup == null && search.isEmpty()) IconButton(onClick = { groupedMode = !groupedMode; AppStorage.settings.putString("me.fin.messageListType", if (groupedMode) "group" else "list") }) {
                        //                     Icon(if (groupedMode) Icons.Filled.UnfoldLess else Icons.Filled.UnfoldMore, contentDescription = "toggle".localized, tint = AssetColors.black.resolve())
                        //                 }
                        //                 Box {
                        //                     IconButton(onClick = { menuOpen = true }) { Icon(Icons.Filled.DeleteOutline, contentDescription = "clear".localized, tint = AssetColors.grey_darken4.resolve()) }
                        //                     DropdownMenu(expanded = menuOpen, onDismissRequest = { menuOpen = false; moreOpen = false }) {
                        //                         if (!moreOpen) {
                        //                             Text("clearFrom".localized, Modifier.padding(horizontal = 16.dp, vertical = 6.dp), fontSize = 12.sp, color = AssetColors.grey_darken1.resolve())
                        //                             listOf(ClearRange.LastHour, ClearRange.Today, ClearRange.TodayAndYesterday, ClearRange.LastMonth, ClearRange.AllTime).forEach { r ->
                        //                                 DropdownMenuItem(text = { Text(r.label) }, onClick = { menuOpen = false; clearAlert(r) })
                        //                             }
                        //                             DropdownMenuItem(text = { Text("more".localized) }, onClick = { moreOpen = true })
                        //                         } else {
                        //                             listOf(ClearRange.BeforeHour, ClearRange.BeforeToday, ClearRange.BeforeYesterday, ClearRange.BeforeMonth).forEach { r ->
                        //                                 DropdownMenuItem(text = { Text(r.label) }, onClick = { menuOpen = false; moreOpen = false; clearAlert(r) })
                        //                             }
                        //                         }
                        //                     }
                        //                 }
                        EmptyView()
                    }
                    HStack(Modifier.padding(horizontal: 16, vertical: 8).fillMaxWidth().clip(RoundedCornerShape(12)).background(Color(0x1F767680)).padding(horizontal: 10, vertical: 9), verticalAlignment: Alignment.CenterVertically) {
                        Icon(Icons.Filled.Search, contentDescription: nil, tint: AssetColors.grey_base.ResolveView())
                            .frame(width: 20, height: 20)
                        BasicTextField(value: search, onValueChange: { search = $0 }, singleLine: true, textStyle: TextStyle(fontSize: 16, color: AssetColors.grey_darken4.ResolveView()))
                            .padding(start: 8)
                            .frame(maxWidth: .infinity)
                    }
                    List {
                        ForEach(visible, id: \.self) { row in
                            // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                            // when (row) {
                            //                         is Row_.Single -> {
                            //                             val state = rememberSwipeToDismissBoxState(confirmValueChange = { v -> if (v == SwipeToDismissBoxValue.EndToStart) { delete(listOf(row.message.id)); true } else false })
                            //                             SwipeToDismissBox(
                            //                                 state = state, enableDismissFromStartToEnd = false,
                            //                                 backgroundContent = { Box(Modifier.fillMaxSize().padding(horizontal = 16.dp).clip(RoundedCornerShape(10.dp)).background(Color(0xFFFF3B30)).padding(end = 20.dp), contentAlignment = Alignment.CenterEnd) { Icon(Icons.Filled.DeleteOutline, contentDescription = null, tint = Color.White) } },
                            //                             ) { MessageCard(row.message) { showMessageActions(row.message) } }
                            //                         }
                            //                         is Row_.Group -> {
                            //                             val expanded = row.name in expandedGroups
                            //                             Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                            //                                 if (!expanded) {
                            //                                     Box {
                            //                                         Box(Modifier.matchParentSize().padding(horizontal = 24.dp).padding(top = 8.dp).clip(RoundedCornerShape(10.dp)).background(AssetColors.background_seconday.resolve().copy(alpha = 0.7f)))
                            //                                         Column { MessageCard(row.messages[0]) { expandedGroups = expandedGroups + row.name } }
                            //                                     }
                            //                                     Text("${row.name} · ${row.total}", Modifier.padding(horizontal = 24.dp).clickable { expandedGroups = expandedGroups + row.name }, fontSize = 12.sp, color = AssetColors.grey_darken1.resolve())
                            //                                 } else {
                            //                                     Text(row.name, Modifier.padding(horizontal = 24.dp), fontSize = 13.sp, fontWeight = FontWeight.SemiBold, color = AssetColors.grey_darken3.resolve())
                            //                                     row.messages.forEach { m -> MessageCard(m) { showMessageActions(m) } }
                            //                                     if (row.total > row.messages.size) Text("viewAllMessages".localized(row.total), Modifier.padding(horizontal = 24.dp).clickable { filterGroup = row.group to true }, fontSize = 14.sp, color = AssetColors.lightBlue_darken3.resolve())
                            //                                     Row(Modifier.padding(horizontal = 24.dp), horizontalArrangement = Arrangement.spacedBy(24.dp)) {
                            //                                         Text("showLess".localized, Modifier.clickable { expandedGroups = expandedGroups - row.name }, fontSize = 14.sp, color = AssetColors.lightBlue_darken3.resolve())
                            //                                         Text("clear".localized, Modifier.clickable { delete(all.filter { it.group == row.group }.map { it.id }) }, fontSize = 14.sp, color = Color(0xFFFF3B30))
                            //                                     }
                            //                                 }
                            //                             }
                            //                         }
                            //                     }
                            EmptyView()
                        }
                    }
                }
                SnackbarHost(snackbar, Modifier.align(Alignment.BottomCenter).padding(bottom: 16))
            }
        }
            .onChange(of: nearEnd) {
                if (nearEnd) pages++
            }
            .onChange(of: search) {
                pages = 1
            }
    }
}
