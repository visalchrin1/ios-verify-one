# OneNative Conversion Report

Target platform: **IOS**
Screens converted: **49**

## AppShell  _(from `app\src\main\java\com\onenative\bark\AppShell.kt`)_

Generated: `AppShellView.swift`

- **[Medium]** NavHost back stack -> @SceneStorage path restoration — Navigation Compose restores the back stack after process death by itself; SwiftUI does not, so the path of this stack was persisted in a `@SceneStorage` Data? (navigationPathData), restored in `.onAppear` while the stack is still empty and saved in `.onChange`, and `AppShellRoute` became `Codable`. A route enum case added later must keep Codable payloads; the `.onChange(of:) { _, newValue in }` form needs iOS 17. Pass `--no-state-restoration` to leave the stack unrestored.
- **[Low]** backStack property — Local delegate `val backStack by nav.currentBackStackEntryAsState()` was not translated as a real binding — only `by remember { mutableStateOf(...) }}` (or its mutableIntStateOf/mutableLongStateOf/mutableFloatStateOf/mutableDoubleStateOf primitive variants) state round-trips to @State — a placeholder property was declared below so this screen's existing references to `backStack` are at least declared; replace its type and add the real delegate logic manually.
- **[Low]** current property — Local value `val current = backStack?.destination?.route` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `current` are at least declared; replace its type and add the real logic manually.
- **[Low]** routes property — Local value `val routes = setOf<String>("HomeViewController", "MessageListViewController", "MessageSettingsViewController", "CryptoSettingController", "NewServerViewController", "ServerListViewController", "SoundsViewController")` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `routes` are at least declared; replace its type and add the real logic manually.
- **[Low]** navigateTo property — Local value `val navigateTo: (String) -> Unit = { route -> if (route in routes) nav.navigate(route) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `navigateTo` are at least declared; replace its type and add the real logic manually.
- **[Medium]** AlertHost -> AlertHostView call — `AlertHost(...)` calls another composable in this project that itself got generated as `AlertHostView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `AlertHostView`'s own parameters were generated).
- **[Low]** Scaffold view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** NavHost -> NavigationStack — Compose's NavHost route graph was translated into a NavigationStack with a generated Route enum and one .navigationDestination(for:) case per composable("...") route — verify the graph shape (start route, nesting) matches; navigate()/popBackStack() calls are reported separately.
- **[Medium]** HomeViewControllerScreen -> HomeViewControllerScreenView call — `HomeViewControllerScreen(...)` calls another composable in this project that itself got generated as `HomeViewControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `HomeViewControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** HomeViewControllerScreen -> HomeViewControllerScreenView call — `HomeViewControllerScreen(...)` calls another composable in this project that itself got generated as `HomeViewControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `HomeViewControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** MessageListViewControllerScreen -> MessageListViewControllerScreenView call — `MessageListViewControllerScreen(...)` calls another composable in this project that itself got generated as `MessageListViewControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `MessageListViewControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** MessageSettingsViewControllerScreen -> MessageSettingsViewControllerScreenView call — `MessageSettingsViewControllerScreen(...)` calls another composable in this project that itself got generated as `MessageSettingsViewControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `MessageSettingsViewControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** CryptoSettingControllerScreen -> CryptoSettingControllerScreenView call — `CryptoSettingControllerScreen(...)` calls another composable in this project that itself got generated as `CryptoSettingControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `CryptoSettingControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** NewServerViewControllerScreen -> NewServerViewControllerScreenView call — `NewServerViewControllerScreen(...)` calls another composable in this project that itself got generated as `NewServerViewControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `NewServerViewControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** ServerListViewControllerScreen -> ServerListViewControllerScreenView call — `ServerListViewControllerScreen(...)` calls another composable in this project that itself got generated as `ServerListViewControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `ServerListViewControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** SoundsViewControllerScreen -> SoundsViewControllerScreenView call — `SoundsViewControllerScreen(...)` calls another composable in this project that itself got generated as `SoundsViewControllerScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `SoundsViewControllerScreenView`'s own parameters were generated).
- **[Medium]** navigate() call — Compose's popBackStack()/navigateUp() was translated to navigationPath.removeLast() — verify this call intended to go back one step, not pop to a specific route.
- **[Medium]** LaunchedEffect -> .onChange — Compose's LaunchedEffect(startRoute) was rewritten to SwiftUI's .onChange(of: startRoute) { ... }, re-running whenever the watched value changes — verify the effect's timing matches (LaunchedEffect does not necessarily run on the exact same occasions onChange would, depending on the source's own logic).
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.

## CryptoSettingControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\CryptoSettingControllerScreen.kt`)_

Generated: `CryptoSettingControllerScreenView.swift`

- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** clipboard property — Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
- **[Low]** stored property — Local value `val stored = remember { cs_load() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `stored` are at least declared; replace its type and add the real logic manually.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fields view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## EmptyRecentMessagesViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\EmptyRecentMessagesViewScreen.kt`)_

Generated: `EmptyRecentMessagesViewScreenView.swift`

- **[Low]** Empty view body — No view tree was extracted from the source — the body may have been genuinely empty, or everything in it was consumed without producing a view (check any parser notes below, and the original source). EmptyView() was emitted as a placeholder.
- **[Low]** Parser note — Could not locate an `@Composable fun ... { ... }` body — no view tree was extracted.

## HomeViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\HomeViewControllerScreen.kt`)_

Generated: `HomeViewControllerScreenView.swift`

- **[Low]** context property — Local value `val context = LocalContext.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `context` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** clipboard property — Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** selected property — Local value `val selected = ExampleType.entries[type]` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `selected` are at least declared; replace its type and add the real logic manually.
- **[Low]** code property — Local value `val code = exampleText(selected, server)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `code` are at least declared; replace its type and add the real logic manually.
- **[Low]** lifecycleOwner property — Local value `val lifecycleOwner = androidx.lifecycle.compose.LocalLifecycleOwner.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `lifecycleOwner` are at least declared; replace its type and add the real logic manually.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** toast view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — `DisposableEffect(lifecycleOwner) {
        val observer = androidx.lifecycle.Lif…` was not translated — DisposableEffect's body isn't a single bare `onDispose { ... }` block (the only shape OneNative translates, to SwiftUI's .onDisappear) — port the logic manually.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Intent not translated — `startActivity(...)` was left as-is for an Intent other than ACTION_VIEW/DIAL/CALL/SENDTO with a literal Uri, a Settings action or a recognized share. Implicit-Intent resolution differences (`resolveActivity` null checks, `ActivityNotFoundException`) don't exist on iOS — `openURL` simply does nothing when no app handles the URL.

## MediumRecentMessagesViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\MediumRecentMessagesViewScreen.kt`)_

Generated: `MediumRecentMessagesViewScreenView.swift`

- **[Low]** TODO view — Not in OneNative's component catalog — copied through as-is.

## MessageListViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\MessageListViewControllerScreen.kt`)_

Generated: `MessageListViewControllerScreenView.swift`

- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** clipboard property — Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
- **[Low]** pageCount property — Local value `val pageCount = 20` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `pageCount` are at least declared; replace its type and add the real logic manually.
- **[Low]** lifecycleOwner property — Local value `val lifecycleOwner = androidx.lifecycle.compose.LocalLifecycleOwner.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `lifecycleOwner` are at least declared; replace its type and add the real logic manually.
- **[Low]** all property — Local value `val all = remember(version) { HistoryMessageStore.all() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `all` are at least declared; replace its type and add the real logic manually.
- **[Low]** filtered property — Local value `val filtered = all.filter { m ->
        (filterGroup == null || m.group == filterGroup!!.first) &&
            (search.isEmpty() || listOf(m.title, m.subtitle, m.body).any { it?.contains(search, ignoreCase = true) == true })
    }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `filtered` are at least declared; replace its type and add the real logic manually.
- **[Low]** asList property — Local value `val asList = filterGroup != null || !groupedMode || search.isNotEmpty()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `asList` are at least declared; replace its type and add the real logic manually.
- **[Low]** rows property — Local value `val rows: List<Row_> = if (asList) filtered.map { Row_.Single(it) } else {
        filtered.map { it.group }.distinct().mapNotNull { g ->
            val ms = filtered.filter { it.group == g }
            when {
                ms.size == 1 -> Row_.Single(ms[0])
                ms.isNotEmpty() -> Row_.Group(g ?: "default".localized, g, ms.size, ms.take(5))
                else -> null
            }
        }
    }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `rows` are at least declared; replace its type and add the real logic manually.
- **[Low]** visible property — Local value `val visible = rows.take(pages * pageCount)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `visible` are at least declared; replace its type and add the real logic manually.
- **[Low]** listState property — Local value `val listState = rememberLazyListState()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `listState` are at least declared; replace its type and add the real logic manually.
- **[Low]** nearEnd property — Local delegate `val nearEnd by remember { derivedStateOf { val last = listState.layoutInfo.visibleItemsInfo.lastOrNull()?.index ?: 0; last >= visible.size - 2 && visible.size < rows.size } }` was not translated as a real binding — only `by remember { mutableStateOf(...) }}` (or its mutableIntStateOf/mutableLongStateOf/mutableFloatStateOf/mutableDoubleStateOf primitive variants) state round-trips to @State — a placeholder property was declared below so this screen's existing references to `nearEnd` are at least declared; replace its type and add the real delegate logic manually.
- **[Low]** sheet property — Local value `val sheet = UIAlertController(null, null, UIAlertControllerStyle.ActionSheet)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `sheet` are at least declared; replace its type and add the real logic manually.
- **[Low]** alert property — Local value `val alert = UIAlertController(null, "${"clearFrom".localized}\n${range.label}", UIAlertControllerStyle.Alert)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `alert` are at least declared; replace its type and add the real logic manually.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** toast view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** scope view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** delete view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** HistoryMessageStore view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** showMessageActions view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** sheet view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** clearAlert view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** alert view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** Icon composable — `this icon` is not in OneNative's icon catalog — copied through as-is; find an equivalent at developer.apple.com/sf-symbols manually.
- **[Medium]** .frame modifier — Compose's single-argument Modifier.size(20.dp) (sets both width and height to the same value) was translated to SwiftUI's .frame(width:height:) with that same value on both — verify the resulting square/fixed size matches.
- **[Low]** BasicTextField view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .fillMaxWidth modifier — Compose's Modifier.fillMaxWidth() was translated to SwiftUI's .frame(maxWidth: .infinity) — the standard "expand to fill available space" idiom on each platform; verify the surrounding layout (a Row/Column vs HStack/VStack) actually gives this view room to expand into.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Medium]** ForEach item identity — Compose's `items(..., key = { r -> when (r) { is Row_.Single -> r.message.id; is Row_.Group -> "g-" + (r.gro…)` key selector could not be translated to a SwiftUI `id:` keypath (only a plain `{ it.property }` shape is recognized) — falling back to `id: \.self` (identity-by-value); verify this doesn't change list diffing/animation/selection behavior.
- **[Low]** SnackbarHost view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .onChange — Compose's LaunchedEffect(nearEnd) was rewritten to SwiftUI's .onChange(of: nearEnd) { ... }, re-running whenever the watched value changes — verify the effect's timing matches (LaunchedEffect does not necessarily run on the exact same occasions onChange would, depending on the source's own logic).
- **[Medium]** LaunchedEffect -> .onChange — Compose's LaunchedEffect(search) was rewritten to SwiftUI's .onChange(of: search) { ... }, re-running whenever the watched value changes — verify the effect's timing matches (LaunchedEffect does not necessarily run on the exact same occasions onChange would, depending on the source's own logic).
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — `DisposableEffect(lifecycleOwner) {
        val observer = androidx.lifecycle.Lif…` was not translated — DisposableEffect's body isn't a single bare `onDispose { ... }` block (the only shape OneNative translates, to SwiftUI's .onDisappear) — port the logic manually.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Medium]** Parser note — `items(visible, ...)` was preserved structurally as ForEach — verify SwiftUI ForEach iteration semantics.
- **[Low]** Parser note — `when (row) {
                        is Row_.Single -> {
                       …` was not translated — pattern matching has no direct SwiftUI/Compose equivalent; rewrite manually (e.g. as an if/else chain).
- **[Medium]** resolve -> ResolveView call — `resolve(...)` calls another composable in this project that itself got generated as `ResolveView` — every call site in this file was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `ResolveView`'s own parameters were generated).

## MessageSettingsViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\MessageSettingsViewControllerScreen.kt`)_

Generated: `MessageSettingsViewControllerScreenView.swift`

- **[Low]** context property — Local value `val context = LocalContext.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `context` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** count property — Local value `val count = remember(version) { HistoryMessageStore.all().size }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `count` are at least declared; replace its type and add the real logic manually.
- **[Low]** exporter property — Local value `val exporter = rememberLauncherForActivityResult(ActivityResultContracts.CreateDocument("application/json")) { uri ->
        if (uri != null) context.contentResolver.openOutputStream(uri)?.use { it.write(exportJson().toByteArray()) }
    }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `exporter` are at least declared; replace its type and add the real logic manually.
- **[Low]** importer property — Local value `val importer = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocument()) { uri ->
        if (uri != null) {
            val text = context.contentResolver.openInputStream(uri)?.use { String(it.readBytes()) } ?: ""
            if (importJson(text)) { version++; toast("done".localized) } else toast("Error")
        }
    }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `importer` are at least declared; replace its type and add the real logic manually.
- **[Low]** sheet property — Local value `val sheet = UIAlertController(null, null, UIAlertControllerStyle.ActionSheet)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `sheet` are at least declared; replace its type and add the real logic manually.
- **[Low]** versionName property — Local value `val versionName = try { context.packageManager.getPackageInfo(context.packageName, 0).let { "${it.versionName} (${it.longVersionCode})" } } catch (e: Exception) { "" }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `versionName` are at least declared; replace its type and add the real logic manually.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** toast view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** scope view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** backupActions view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** sheet view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .font modifier — Compose's MaterialTheme.typography.headlineMedium was mapped to .font(.title) by visual role — the two type scales don't match point-for-point, verify the size/weight reads correctly.
- **[Medium]** .fontWeight modifier — Weight token spelling differs (.bold vs FontWeight.Bold) — verify the value translated to a valid token on the target platform.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** SectionHeader view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** Group wrapper — Compose's Group has no SwiftUI equivalent wrapping view, so its content was unwrapped as-is — nothing (Group has no rendering role of its own).
- **[Low]** Row_ view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** Row_ view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** SectionFooter view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** SectionHeader view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** Group wrapper — Compose's Group has no SwiftUI equivalent wrapping view, so its content was unwrapped as-is — nothing (Group has no rendering role of its own).
- **[Low]** Row_ view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** SectionFooter view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** SectionHeader view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** Group wrapper — Compose's Group has no SwiftUI equivalent wrapping view, so its content was unwrapped as-is — nothing (Group has no rendering role of its own).
- **[Low]** Row_ view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** Row_ view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** Row_ view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** SnackbarHost view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Medium]** resolve -> ResolveView call — `resolve(...)` calls another composable in this project that itself got generated as `ResolveView` — every call site in this file was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `ResolveView`'s own parameters were generated).

## NewServerViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\NewServerViewControllerScreen.kt`)_

Generated: `NewServerViewControllerScreenView.swift`

- **[Medium]** viewModel: hiltViewModel() → @StateObject — `viewModel: NewServerViewModel = hiltViewModel()` is now a `@StateObject` owning the translated `NewServerViewModel` (NewServerViewModel.swift), built by `NewServerViewModel.make(...)`, which takes its dependencies from `AppDependencies` (Hilt/Koin wiring isn't translated — implement those).
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** focusManager property — Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
- **[Low]** addressTextFieldFocus property — Local value `val addressTextFieldFocus = remember { FocusRequester() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `addressTextFieldFocus` are at least declared; replace its type and add the real logic manually.
- **[Low]** noticeLabelTap property — Local value `val noticeLabelTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `noticeLabelTap` are at least declared; replace its type and add the real logic manually.
- **[Low]** doneButtonTap property — Local value `val doneButtonTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `doneButtonTap` are at least declared; replace its type and add the real logic manually.
- **[Low]** scanButtonTap property — Local value `val scanButtonTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scanButtonTap` are at least declared; replace its type and add the real logic manually.
- **[Low]** viewDidAppearEvent property — Local value `val viewDidAppearEvent = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `viewDidAppearEvent` are at least declared; replace its type and add the real logic manually.
- **[Low]** Scaffold view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## SectionViewController_iPadScreen  _(from `app\src\main\java\com\onenative\bark\screens\SectionViewController_iPadScreen.kt`)_

Generated: `SectionViewControlleriPadScreenView.swift`

- **[Medium]** NotYetPortedScreen -> NotYetPortedScreenView call — `NotYetPortedScreen(...)` calls another composable in this project that itself got generated as `NotYetPortedScreenView` — this call site was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `NotYetPortedScreenView`'s own parameters were generated).

## ServerListViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\ServerListViewControllerScreen.kt`)_

Generated: `ServerListViewControllerScreenView.swift`

- **[Low]** context property — Local value `val context = LocalContext.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `context` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** clipboard property — Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
- **[Low]** states property — Local value `val states = remember { mutableStateMapOf<String, Boolean>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `states` are at least declared; replace its type and add the real logic manually.
- **[Low]** servers property — Local value `val servers = ServerManager.shared.servers.toList().also { version }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `servers` are at least declared; replace its type and add the real logic manually.
- **[Low]** alert property — Local value `val alert = UIAlertController(null, message, UIAlertControllerStyle.Alert)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `alert` are at least declared; replace its type and add the real logic manually.
- **[Low]** sheet property — Local value `val sheet = UIAlertController(null, server.host, UIAlertControllerStyle.ActionSheet)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `sheet` are at least declared; replace its type and add the real logic manually.
- **[Low]** state property — Local value `val state = states[server.id]` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `state` are at least declared; replace its type and add the real logic manually.
- **[Low]** name property — Local value `val name = server.host.ifEmpty { "Invalid Server" }.let { host -> if (!server.name.isNullOrEmpty()) server.name + "\n" + host else host }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `name` are at least declared; replace its type and add the real logic manually.
- **[Low]** res property — Local value `val res = context.resources.getIdentifier(if (state == false) "offline" else "online", "drawable", context.packageName)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `res` are at least declared; replace its type and add the real logic manually.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** toast view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** scope view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** confirmAlert view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** alert view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** showActions view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** sheet view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .font modifier — Compose's MaterialTheme.typography.headlineMedium was mapped to .font(.title) by visual role — the two type scales don't match point-for-point, verify the size/weight reads correctly.
- **[Medium]** .fontWeight modifier — Weight token spelling differs (.bold vs FontWeight.Bold) — verify the value translated to a valid token on the target platform.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** Button view — Compose's IconButton(onClick=){ Icon(...) } (a chromeless icon-only tap target, Compose's own idiom for a toolbar/inline icon action) was mapped to SwiftUI's equivalent idiom, an ordinary Button(action:){ Image(systemName:) } — a distinct catalog entry from the plain Button mapping above so its onClick argument still renames to action: (see AdjustPropsForSwift) without the two colliding.
- **[Low]** Icon composable — `this icon` is not in OneNative's icon catalog — copied through as-is; find an equivalent at developer.apple.com/sf-symbols manually.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Medium]** ForEach item identity — Compose's `items(..., key = { it.id })` key selector was translated to `ForEach(..., id: \.id)` — verify `id` is Hashable and uniquely identifies each item.
- **[Low]** Icon composable — `this icon` is not in OneNative's icon catalog — copied through as-is; find an equivalent at developer.apple.com/sf-symbols manually.
- **[Medium]** .frame modifier — Compose's single-argument Modifier.size(30.dp) (sets both width and height to the same value) was translated to SwiftUI's .frame(width:height:) with that same value on both — verify the resulting square/fixed size matches.
- **[Medium]** modifier argument — Swift has no `if`-as-expression (in the subset this tool targets) — rewrote Kotlin's `if (cond) a else b` to `cond ? a : b`; verify both branches still read correctly.
- **[Medium]** .fontWeight modifier — Weight token spelling differs (.bold vs FontWeight.Bold) — verify the value translated to a valid token on the target platform.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** SnackbarHost view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .onChange — Compose's LaunchedEffect(servers.map { it.id + it.address }) was rewritten to SwiftUI's .onChange(of: servers.map { $0.id + $0.address }) { ... }, re-running whenever the watched value changes — verify the effect's timing matches (LaunchedEffect does not necessarily run on the exact same occasions onChange would, depending on the source's own logic).
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Medium]** Parser note — `items(servers, ...)` was preserved structurally as ForEach — verify SwiftUI ForEach iteration semantics.
- **[Medium]** resolve -> ResolveView call — `resolve(...)` calls another composable in this project that itself got generated as `ResolveView` — every call site in this file was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `ResolveView`'s own parameters were generated).

## SmallRecentMessagesViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\SmallRecentMessagesViewScreen.kt`)_

Generated: `SmallRecentMessagesViewScreenView.swift`

- **[Low]** TODO view — Not in OneNative's component catalog — copied through as-is.

## SoundsViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\SoundsViewControllerScreen.kt`)_

Generated: `SoundsViewControllerScreenView.swift`

- **[Low]** context property — Local value `val context = LocalContext.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `context` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** clipboard property — Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** defaults property — Local value `val defaults = remember { loadDefault(context) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `defaults` are at least declared; replace its type and add the real logic manually.
- **[Low]** customs property — Local value `val customs = remember(version) { loadCustom(context) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `customs` are at least declared; replace its type and add the real logic manually.
- **[Low]** wasPlaying property — Local value `val wasPlaying = playing == key` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `wasPlaying` are at least declared; replace its type and add the real logic manually.
- **[Low]** picker property — Local value `val picker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocument()) { uri: Uri? ->
        if (uri == null) return@rememberLauncherForActivityResult
        val name = context.contentResolver.query(uri, null, null, null, null)?.use { c ->
            val i = c.getColumnIndex(android.provider.OpenableColumns.DISPLAY_NAME)
            if (c.moveToFirst() && i >= 0) c.getString(i) else null
        } ?: "sound_${System.currentTimeMillis()}.m4a"
        context.contentResolver.openInputStream(uri)?.use { input -> File(customDir(), name).outputStream().use { input.copyTo(it) } }
        version++
    }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `picker` are at least declared; replace its type and add the real logic manually.
- **[Low]** state property — Local value `val state = rememberSwipeToDismissBoxState(confirmValueChange = { value ->
                        if (value == SwipeToDismissBoxValue.EndToStart) {
                            if (playing == "c-" + entry.name) stop()
                            entry.file?.delete()
                            version++
                            true
                        } else false
                    })` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `state` are at least declared; replace its type and add the real logic manually.
- **[Low]** full property — Local value `val full = "uploadSoundNoticeFullText".localized` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `full` are at least declared; replace its type and add the real logic manually.
- **[Low]** highlight property — Local value `val highlight = "uploadSoundNoticeHighlightText".localized` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `highlight` are at least declared; replace its type and add the real logic manually.
- **[Low]** start property — Local value `val start = full.indexOf(highlight)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `start` are at least declared; replace its type and add the real logic manually.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** stop view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** player view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** play view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** stop view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** copyName view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** clipboard view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .font modifier — Compose's MaterialTheme.typography.headlineMedium was mapped to .font(.title) by visual role — the two type scales don't match point-for-point, verify the size/weight reads correctly.
- **[Medium]** .fontWeight modifier — Weight token spelling differs (.bold vs FontWeight.Bold) — verify the value translated to a valid token on the target platform.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** Button view — Compose's IconButton(onClick=){ Icon(...) } (a chromeless icon-only tap target, Compose's own idiom for a toolbar/inline icon action) was mapped to SwiftUI's equivalent idiom, an ordinary Button(action:){ Image(systemName:) } — a distinct catalog entry from the plain Button mapping above so its onClick argument still renames to action: (see AdjustPropsForSwift) without the two colliding.
- **[Low]** Icon composable — `this icon` is not in OneNative's icon catalog — copied through as-is; find an equivalent at developer.apple.com/sf-symbols manually.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** ForEach item identity — Compose's `items(..., key = { "c-" + it.name })` key selector could not be translated to a SwiftUI `id:` keypath (only a plain `{ it.property }` shape is recognized) — falling back to `id: \.self` (identity-by-value); verify this doesn't change list diffing/animation/selection behavior.
- **[Low]** SwipeToDismissBox view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** SoundRow view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** Icon composable — `this icon` is not in OneNative's icon catalog — copied through as-is; find an equivalent at developer.apple.com/sf-symbols manually.
- **[Medium]** .frame modifier — Compose's single-argument Modifier.size(20.dp) (sets both width and height to the same value) was translated to SwiftUI's .frame(width:height:) with that same value on both — verify the resulting square/fixed size matches.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** ForEach item identity — Compose's `items(..., key = { "d-" + it.name })` key selector could not be translated to a SwiftUI `id:` keypath (only a plain `{ it.property }` shape is recognized) — falling back to `id: \.self` (identity-by-value); verify this doesn't change list diffing/animation/selection behavior.
- **[Low]** SoundRow view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** SnackbarHost view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** DisposableEffect -> .onDisappear — Compose's DisposableEffect(Unit) { onDispose { ... } } was rewritten to SwiftUI's .onDisappear { ... } — verify this fires at the intended time (onDisappear runs when the view leaves the hierarchy, which usually matches DisposableEffect's onDispose semantics).
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Medium]** Parser note — `items(customs, ...)` was preserved structurally as ForEach — verify SwiftUI ForEach iteration semantics.
- **[Low]** Parser note — `horizontalArrangement = Arrangement.Center` was not translated — only Arrangement.spacedBy(...) round-trips to SwiftUI spacing.
- **[Medium]** Parser note — `items(defaults, ...)` was preserved structurally as ForEach — verify SwiftUI ForEach iteration semantics.
- **[Medium]** resolve -> ResolveView call — `resolve(...)` calls another composable in this project that itself got generated as `ResolveView` — every call site in this file was renamed to match; verify the argument shape (a positional value here may need to become a named binding, e.g. `resource:`, depending on how `ResolveView`'s own parameters were generated).

## TimeBadgeViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\TimeBadgeViewScreen.kt`)_

Generated: `TimeBadgeViewScreenView.swift`

- **[Low]** .font modifier — `androidx.compose.ui.text.TextStyle(fontSize = 10.sp, fontWeight = FontWeight.Bold, fontFamily = androidx.compose.ui.text.font.FontFamily.SansSerif)` is not a recognized Compose typography token (MaterialTheme.typography.titleMedium, etc.) — copied through as-is; find an equivalent SwiftUI Font style manually.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.

## WidgetEntryViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\WidgetEntryViewScreen.kt`)_

Generated: `WidgetEntryViewScreenView.swift`

- **[Low]** TODO view — Not in OneNative's component catalog — copied through as-is.

## WidgetHeaderViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\WidgetHeaderViewScreen.kt`)_

Generated: `WidgetHeaderViewScreenView.swift`

- **[Low]** TODO view — Not in OneNative's component catalog — copied through as-is.

## AlertHost  _(from `app\src\main\java\com\onenative\bark\support\Alerts.kt`)_

Generated: `AlertHostView.swift`

- **[Low]** alert property — Local delegate `val alert by UiAlerts.current.collectAsState()` was not translated as a real binding — only `by remember { mutableStateOf(...) }}` (or its mutableIntStateOf/mutableLongStateOf/mutableFloatStateOf/mutableDoubleStateOf primitive variants) state round-trips to @State — a placeholder property was declared below so this screen's existing references to `alert` are at least declared; replace its type and add the real delegate logic manually.
- **[Low]** current property — Local value `val current = alert ?: return` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `current` are at least declared; replace its type and add the real logic manually.
- **[Low]** values property — Local value `val values = remember(current) { mutableStateListOf<String>().also { list -> current.textFields.forEach { list.add(it.text ?: "") } } }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `values` are at least declared; replace its type and add the real logic manually.
- **[Low]** cancel property — Local value `val cancel = current.actions.lastOrNull { it.style == UIAlertActionStyle.Cancel }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `cancel` are at least declared; replace its type and add the real logic manually.
- **[Low]** others property — Local value `val others = current.actions.filter { it !== cancel }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `others` are at least declared; replace its type and add the real logic manually.
- **[Low]** dismissCancel property — Local value `val dismissCancel: () -> Unit = { UiAlerts.dismiss(current); cancel?.handler?.invoke(cancel) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `dismissCancel` are at least declared; replace its type and add the real logic manually.
- **[Low]** color property — Local value `val color = if (action.style == UIAlertActionStyle.Destructive) MaterialTheme.colorScheme.error else Color.Unspecified` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `color` are at least declared; replace its type and add the real logic manually.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** choose view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** current view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** @Composable view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** Body view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** current view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** @Composable view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** Buttons view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** TextButton view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Medium]** .fillMaxWidth modifier — Compose's Modifier.fillMaxWidth() was translated to SwiftUI's .frame(maxWidth: .infinity) — the standard "expand to fill available space" idiom on each platform; verify the surrounding layout (a Row/Column vs HStack/VStack) actually gives this view room to expand into.
- **[Low]** ModalBottomSheet view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** current view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** AlertDialog view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Medium]** Parser note — `for (action in others + listOfNotNull(cancel))` loop was preserved structurally — verify SwiftUI ForEach iteration semantics.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.
- **[Medium]** Parser note — Conditional composable (`if (current.preferredStyle == UIAlertControllerStyle.ActionSheet)`) was preserved structurally — verify the condition and branches compile as translated.

## resolve  _(from `app\src\main\java\com\onenative\bark\support\AssetColors.kt`)_

Generated: `ResolveView.swift`

- **[Low]** background property — Local value `val background = AssetColor(0xFFF5F5F5, 0xFF000000)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `background` are at least declared; replace its type and add the real logic manually.
- **[Low]** background_seconday property — Local value `val background_seconday = AssetColor(0xFFFFFFFF, 0xFF161616)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `background_seconday` are at least declared; replace its type and add the real logic manually.
- **[Low]** black property — Local value `val black = AssetColor(0xFF000000, 0xFFFFFFFF)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `black` are at least declared; replace its type and add the real logic manually.
- **[Low]** blue_base property — Local value `val blue_base = AssetColor(0xFF2196F3, 0xFF2196F3)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `blue_base` are at least declared; replace its type and add the real logic manually.
- **[Low]** blue_darken1 property — Local value `val blue_darken1 = AssetColor(0xFF1E88E5, 0xFF42A5F5)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `blue_darken1` are at least declared; replace its type and add the real logic manually.
- **[Low]** blue_darken5 property — Local value `val blue_darken5 = AssetColor(0xFF222ED8, 0xFF462CE9)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `blue_darken5` are at least declared; replace its type and add the real logic manually.
- **[Low]** command_color property — Local value `val command_color = AssetColor(0xFF8250DF, 0xFFD2A8FF)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `command_color` are at least declared; replace its type and add the real logic manually.
- **[Low]** darkText_primary property — Local value `val darkText_primary = AssetColor(0xDEFFFFFF, 0xDE000000)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `darkText_primary` are at least declared; replace its type and add the real logic manually.
- **[Low]** darkText_secondary property — Local value `val darkText_secondary = AssetColor(0x8AFFFFFF, 0x8A000000)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `darkText_secondary` are at least declared; replace its type and add the real logic manually.
- **[Low]** flag_color property — Local value `val flag_color = AssetColor(0xFFCF222E, 0xFFFF7B72)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `flag_color` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_base property — Local value `val grey_base = AssetColor(0xFF9E9E9E, 0xFF616161)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_base` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_darken1 property — Local value `val grey_darken1 = AssetColor(0xFF757575, 0xFFBDBDBD)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_darken1` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_darken2 property — Local value `val grey_darken2 = AssetColor(0xFF616161, 0xFFE0E0E0)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_darken2` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_darken3 property — Local value `val grey_darken3 = AssetColor(0xFF424242, 0xFFEEEEEE)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_darken3` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_darken4 property — Local value `val grey_darken4 = AssetColor(0xFF212121, 0xFFF5F5F5)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_darken4` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_lighten1 property — Local value `val grey_lighten1 = AssetColor(0xFFBDBDBD, 0xFF757575)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_lighten1` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_lighten2 property — Local value `val grey_lighten2 = AssetColor(0xFFD6D6D6, 0xFF5C5C5C)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_lighten2` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_lighten3 property — Local value `val grey_lighten3 = AssetColor(0xFFEEEEEE, 0xFF424242)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_lighten3` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_lighten4 property — Local value `val grey_lighten4 = AssetColor(0xFFF5F5F5, 0xFF212121)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_lighten4` are at least declared; replace its type and add the real logic manually.
- **[Low]** grey_lighten5 property — Local value `val grey_lighten5 = AssetColor(0xFFFAFAFA, 0xFF1C1C1C)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `grey_lighten5` are at least declared; replace its type and add the real logic manually.
- **[Low]** home_accent_blue property — Local value `val home_accent_blue = AssetColor(0xFFD6EAFF, 0xFF0F345C)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `home_accent_blue` are at least declared; replace its type and add the real logic manually.
- **[Low]** home_accent_orange property — Local value `val home_accent_orange = AssetColor(0xFFFFEED6, 0xFF5C3C0F)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `home_accent_orange` are at least declared; replace its type and add the real logic manually.
- **[Low]** home_accent_teal property — Local value `val home_accent_teal = AssetColor(0xFFDEF2F6, 0xFF1E444B)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `home_accent_teal` are at least declared; replace its type and add the real logic manually.
- **[Low]** home_code_panel property — Local value `val home_code_panel = AssetColor(0xFFF1F3F6, 0xFF202226)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `home_code_panel` are at least declared; replace its type and add the real logic manually.
- **[Low]** home_divider property — Local value `val home_divider = AssetColor(0xFFD9DDE3, 0xFF30333A)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `home_divider` are at least declared; replace its type and add the real logic manually.
- **[Low]** home_legacy_border property — Local value `val home_legacy_border = AssetColor(0xFFD6DAE1, 0xFF35383E)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `home_legacy_border` are at least declared; replace its type and add the real logic manually.
- **[Low]** home_legacy_button property — Local value `val home_legacy_button = AssetColor(0xFFF7F8FA, 0xFF1C1F24)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `home_legacy_button` are at least declared; replace its type and add the real logic manually.
- **[Low]** lightBlue_darken3 property — Local value `val lightBlue_darken3 = AssetColor(0xFF0277BD, 0xFF81D4FA)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `lightBlue_darken3` are at least declared; replace its type and add the real logic manually.
- **[Low]** notification_copy_color property — Local value `val notification_copy_color = AssetColor(0xFF000000, 0xFFFFFFFF)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `notification_copy_color` are at least declared; replace its type and add the real logic manually.
- **[Low]** string_color property — Local value `val string_color = AssetColor(0xFF0A3069, 0xFFA5D6FF)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `string_color` are at least declared; replace its type and add the real logic manually.
- **[Low]** white property — Local value `val white = AssetColor(0xFFFFFFFF, 0xFF000000)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `white` are at least declared; replace its type and add the real logic manually.
- **[Low]** all property — Local value `val all = mapOf("background" to background, "background_seconday" to background_seconday, "black" to black, "blue_base" to blue_base, "blue_darken1" to blue_darken1, "blue_darken5" to blue_darken5, "command_color" to command_color, "darkText_primary" to darkText_primary, "darkText_secondary" to darkText_secondary, "flag_color" to flag_color, "grey_base" to grey_base, "grey_darken1" to grey_darken1, "grey_darken2" to grey_darken2, "grey_darken3" to grey_darken3, "grey_darken4" to grey_darken4, "grey_lighten1" to grey_lighten1, "grey_lighten2" to grey_lighten2, "grey_lighten3" to grey_lighten3, "grey_lighten4" to grey_lighten4, "grey_lighten5" to grey_lighten5, "home_accent_blue" to home_accent_blue, "home_accent_orange" to home_accent_orange, "home_accent_teal" to home_accent_teal, "home_code_panel" to home_code_panel, "home_divider" to home_divider, "home_legacy_border" to home_legacy_border, "home_legacy_button" to home_legacy_button, "lightBlue_darken3" to lightBlue_darken3, "notification_copy_color" to notification_copy_color, "string_color" to string_color, "white" to white)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `all` are at least declared; replace its type and add the real logic manually.
- **[Low]** private view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** fun view — Not in OneNative's component catalog — copied through as-is.
- **[Low]** named view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** Root view wrapping — Multiple top-level views were wrapped in a VStack since SwiftUI requires a single root view — verify this is the intended layout.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## NotYetPortedScreen  _(from `app\src\main\java\com\onenative\bark\support\Placeholder.kt`)_

Generated: `NotYetPortedScreenView.swift`

- **[Medium]** .font modifier — Compose's MaterialTheme.typography.titleLarge was mapped to .font(.title3) by visual role — the two type scales don't match point-for-point, verify the size/weight reads correctly.
- **[Medium]** .font modifier — Compose's MaterialTheme.typography.bodyMedium was mapped to .font(.callout) by visual role — the two type scales don't match point-for-point, verify the size/weight reads correctly.
- **[Medium]** .fillMaxSize modifier — Compose's Modifier.fillMaxSize() was translated to SwiftUI's .frame(maxWidth: .infinity, maxHeight: .infinity) — the standard "expand to fill available space" idiom on each platform; verify the surrounding layout (a Row/Column vs HStack/VStack) actually gives this view room to expand into.
- **[Low]** Parser note — `verticalArrangement = Arrangement.Center` was not translated — only Arrangement.spacedBy(...) round-trips to SwiftUI spacing.

## BarkTheme  _(from `app\src\main\java\com\onenative\bark\ui\theme\Theme.kt`)_

Generated: `BarkThemeView.swift`

- **[Medium]** content parameter — Compose's trailing-content-lambda parameter `content: @Composable () -> Unit` was recognized as this composable's own child-content builder — the struct was made generic (`<Content: View>`) with `content` declared `@ViewBuilder`; verify every call site now supplies a trailing closure (`BarkThemeView { ... }`) instead of passing a value positionally.
- **[Low]** colorScheme property — Local value `val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }
        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `colorScheme` are at least declared; replace its type and add the real logic manually.
- **[Medium]** MaterialTheme wrapper — Compose's MaterialTheme has no SwiftUI equivalent wrapping view, so its content was unwrapped as-is — recreate its color scheme/typography with environment modifiers (.tint(), custom Font) manually.

## CryptoSettingViewModel  _(from `app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt`)_

Generated: `CryptoSettingViewModel.swift`

- **[Low]** CryptoSettingViewModel: ViewModel → ObservableObject — `CryptoSettingViewModel` (from app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt) was translated except: `transform()` (an overridden function); `preservingIv()` (the call `TODO(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## HomeViewModel  _(from `app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt`)_

Generated: `HomeViewModel.swift`

- **[Low]** HomeViewModel: ViewModel → ObservableObject — `HomeViewModel` (from app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt) was translated except: `transform()` (an overridden function); `sendTestPush()` (the type `Observable` isn't a primitive, collection or type declared in the project); `makeTestRequest()` (the type `Server` isn't a primitive, collection or type declared in the project); `makeExampleText()` (the call `TODO(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## MessageListViewModel  _(from `app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt`)_

Generated: `MessageListViewModel.swift`

- **[Low]** MessageListViewModel: ViewModel → ObservableObject — `MessageListViewModel` (from app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt) was translated except: `type` (the type `MessageListType` isn't a primitive, collection or type declared in the project); `groups` (the type `Results` isn't a primitive, collection or type declared in the project); `results` (the type `Results` isn't a primitive, collection or type declared in the project); `errorAlert` (the type `PublishRelay` isn't a primitive, collection or type declared in the project); `getResults()` (the type `Results` isn't a primitive, collection or type declared in the project); `getGroups()` (the type `Results` isn't a primitive, collection or type declared in the project); `getMessages()` (the type `Results` isn't a primitive, collection or type declared in the project); `transform()` (an overridden function); `reloadResults()` (`is`); `getListNextPage()` (an infix call or unknown operator `until`); `getGroupNextPage()` (an infix call or unknown operator `until`); `getPage()` (`is`). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8). Also: a companion object isn't translated.

## MessageSettingsViewModel  _(from `app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt`)_

Generated: `MessageSettingsViewModel.swift`

- **[Low]** MessageSettingsViewModel: ViewModel → ObservableObject — `MessageSettingsViewModel` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was translated except: `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## NewServerViewModel  _(from `app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt`)_

Generated: `NewServerViewModel.swift`

- **[Low]** NewServerViewModel: ViewModel → ObservableObject — `NewServerViewModel` (from app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt) was translated except: `pop` (the call `PublishRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## ServerListViewModel  _(from `app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt`)_

Generated: `ServerListViewModel.swift`

- **[Low]** ServerListViewModel: ViewModel → ObservableObject — `ServerListViewModel` (from app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt) was translated except: `serverStates` (the call `mutableMapOf(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## SoundsViewModel  _(from `app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt`)_

Generated: `SoundsViewModel.swift`

- **[Low]** SoundsViewModel: ViewModel → ObservableObject — `SoundsViewModel` (from app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt) was translated except: `getSounds()` (the type `android.net.Uri` isn't a primitive, collection or type declared in the project); `getFilesInDirectory()` (the type `android.net.Uri` isn't a primitive, collection or type declared in the project); `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## ViewModelTypes  _(from ``)_

Generated: `ViewModelTypes.swift`

- **[Medium]** CryptoSettingFields: data class → struct — `CryptoSettingFields` (from app\src\main\java\com\onenative\bark\screens\Algorithm.kt) was declared as a Swift struct with its stored properties.

## Algorithm  _(from `app\src\main\java\com\onenative\bark\screens\Algorithm.kt`)_

Generated: `Algorithm.swift`

- **[Medium]** AESCryptoModel: data class → struct — `AESCryptoModel` (from app\src\main\java\com\onenative\bark\screens\Algorithm.kt) was declared as a Swift struct; member bodies were translated statement by statement — verify behavior, especially collection and string methods. Also: a companion object, init block, or nested type wasn't carried over.

## BarkApi  _(from `app\src\main\java\com\onenative\bark\screens\BarkApi.kt`)_

Generated: `BarkApi.swift`

- **[Medium]** ping: data class → struct — `ping` (from app\src\main\java\com\onenative\bark\screens\BarkApi.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to BarkApi() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** register: data class → struct — `register` (from app\src\main\java\com\onenative\bark\screens\BarkApi.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to BarkApi() weren't carried over — reverse interface translation isn't attempted by this pass.

## CryptoSettingViewModel  _(from `app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt`)_

Generated: `CryptoSettingViewModelModels.swift`

- **[Medium]** InitialTuple: data class → struct — `InitialTuple` (from app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt) was declared as a Swift struct with its stored properties.

## ErrorExtension  _(from `app\src\main\java\com\onenative\bark\screens\ErrorExtension.kt`)_

Generated: `ErrorExtension.swift`

- **[Medium]** Error: data class → struct — `Error` (from app\src\main\java\com\onenative\bark\screens\ErrorExtension.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ApiError() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** AccountBanned: data class → struct — `AccountBanned` (from app\src\main\java\com\onenative\bark\screens\ErrorExtension.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ApiError() weren't carried over — reverse interface translation isn't attempted by this pass.

## HomeViewModel  _(from `app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt`)_

Generated: `HomeViewModelModels.swift`

- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt) was declared as a Swift struct with its stored properties.

## MessageListSkeletonView  _(from `app\src\main\java\com\onenative\bark\screens\MessageListSkeletonView.kt`)_

Generated: `MessageListSkeletonView.swift`

- **[Medium]** CardConfig: data class → struct — `CardConfig` (from app\src\main\java\com\onenative\bark\screens\MessageListSkeletonView.kt) was declared as a Swift struct with its stored properties.

## MessageListViewModel  _(from `app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt`)_

Generated: `MessageListViewModelModels.swift`

- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt) was declared as a Swift struct with its stored properties.

## MessageSection  _(from `app\src\main\java\com\onenative\bark\screens\MessageSection.kt`)_

Generated: `MessageSection.swift`

- **[Medium]** MessageSection: data class → struct — `MessageSection` (from app\src\main\java\com\onenative\bark\screens\MessageSection.kt) was declared as a Swift struct with its stored properties.

## MessageSettingsViewModel  _(from `app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt`)_

Generated: `MessageSettingsViewModelModels.swift`

- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** label: data class → struct — `label` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to MessageSettingItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** archiveSetting: data class → struct — `archiveSetting` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to MessageSettingItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** detail: data class → struct — `detail` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to MessageSettingItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** backup: data class → struct — `backup` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to MessageSettingItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** deviceToken: data class → struct — `deviceToken` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to MessageSettingItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** spacer: data class → struct — `spacer` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to MessageSettingItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** donate: data class → struct — `donate` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to MessageSettingItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** MessageSettingSection: data class → struct — `MessageSettingSection` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was declared as a Swift struct with its stored properties.

## NewServerViewModel  _(from `app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt`)_

Generated: `NewServerViewModelModels.swift`

- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt) was declared as a Swift struct with its stored properties.

## NotificationContentProcessor  _(from `app\src\main\java\com\onenative\bark\screens\NotificationContentProcessor.kt`)_

Generated: `NotificationContentProcessor.swift`

- **[Medium]** error: data class → struct — `error` (from app\src\main\java\com\onenative\bark\screens\NotificationContentProcessor.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to NotificationContentProcessorError() weren't carried over — reverse interface translation isn't attempted by this pass.

## PushResponse  _(from `app\src\main\java\com\onenative\bark\screens\PushResponse.kt`)_

Generated: `PushResponse.swift`

- **[Medium]** PushResponse: data class → struct — `PushResponse` (from app\src\main\java\com\onenative\bark\screens\PushResponse.kt) was declared as a Swift struct with its stored properties.

## SectionViewModeliPad  _(from `app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt`)_

Generated: `SectionViewModeliPad.swift`

- **[Medium]** SectionItem: data class → struct — `SectionItem` (from app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt) was declared as a Swift struct with its stored properties.

## ServerListViewController  _(from `app\src\main\java\com\onenative\bark\screens\ServerListViewController.kt`)_

Generated: `ServerListViewController.swift`

- **[Medium]** reset: data class → struct — `reset` (from app\src\main\java\com\onenative\bark\screens\ServerListViewController.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ServerActionType() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** setName: data class → struct — `setName` (from app\src\main\java\com\onenative\bark\screens\ServerListViewController.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ServerActionType() weren't carried over — reverse interface translation isn't attempted by this pass.

## ServerListViewModel  _(from `app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt`)_

Generated: `ServerListViewModelModels.swift`

- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt) was declared as a Swift struct with its stored properties.

## SimpleEntry  _(from `app\src\main\java\com\onenative\bark\screens\SimpleEntry.kt`)_

Generated: `SimpleEntry.swift`

- **[Medium]** SimpleEntry: data class → struct — `SimpleEntry` (from app\src\main\java\com\onenative\bark\screens\SimpleEntry.kt) was declared as a Swift struct with its stored properties.

## SoundsViewModel  _(from `app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt`)_

Generated: `SoundsViewModelModels.swift`

- **[Medium]** sound: data class → struct — `sound` (from app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to SoundItem() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt) was declared as a Swift struct with its stored properties.

## WidgetConfigurationIntent  _(from `app\src\main\java\com\onenative\bark\screens\WidgetConfigurationIntent.kt`)_

Generated: `WidgetConfigurationIntent.swift`

- **[Medium]** WidgetGroupSelectionIntent: data class → struct — `WidgetGroupSelectionIntent` (from app\src\main\java\com\onenative\bark\screens\WidgetConfigurationIntent.kt) was declared as a Swift struct with its stored properties. Also: a companion object, init block, or nested type wasn't carried over.

## WidgetHistoryModels  _(from `app\src\main\java\com\onenative\bark\screens\WidgetHistoryModels.kt`)_

Generated: `WidgetHistoryModels.swift`

- **[Medium]** WidgetHistoryMessage: data class → struct — `WidgetHistoryMessage` (from app\src\main\java\com\onenative\bark\screens\WidgetHistoryModels.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** WidgetHistorySnapshot: data class → struct — `WidgetHistorySnapshot` (from app\src\main\java\com\onenative\bark\screens\WidgetHistoryModels.kt) was declared as a Swift struct; member bodies were translated statement by statement — verify behavior, especially collection and string methods. Also: `recentMessages` wasn't carried over — one of its parameters (`limit: Int = WidgetHistoryConstants.displayLimit`) isn't a recognized shape (a defaulted parameter isn't attempted by this pass); a companion object, init block, or nested type wasn't carried over.

## Compat  _(from `app\src\main\java\com\onenative\bark\support\Compat.kt`)_

Generated: `Compat.swift`

- **[Medium]** CGPoint: data class → struct — `CGPoint` (from app\src\main\java\com\onenative\bark\support\Compat.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** CGSize: data class → struct — `CGSize` (from app\src\main\java\com\onenative\bark\support\Compat.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** CGRect: data class → struct — `CGRect` (from app\src\main\java\com\onenative\bark\support\Compat.kt) was declared as a Swift struct with its stored properties.

## Http  _(from `app\src\main\java\com\onenative\bark\support\Http.kt`)_

Generated: `Http.swift`

- **[Medium]** HttpRequest: data class → struct — `HttpRequest` (from app\src\main\java\com\onenative\bark\support\Http.kt) was declared as a Swift struct with its stored properties.

## Rx  _(from `app\src\main\java\com\onenative\bark\support\Rx.kt`)_

Generated: `Rx.swift`

- **[Low]** Declaration not translated — `data class SectionModel<...>` isn't translated — a generic data class isn't attempted by this pass

