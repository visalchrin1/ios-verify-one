# OneNative Conversion Report

Target platform: **IOS**
Screens converted: **54**

## Windows (WindowGroup scenes)

The App's secondary `WindowGroup(id:)` scenes and the `openWindow(id:)` calls that open them:

- **[Medium]** Launch screen -> UILaunchScreen — The app theme 'Theme.OneNative.Launch' gives the launch look: . Animation, branding and a splash icon's own background are not part of an iOS launch screen. Not translated: @drawable/launch_background: not an image or simple vector (launch_background: <layer-list> drawables (shape, selector, layer-list, ...) are not translated).
- **[Medium]** Resource folders not converted — These Android resource folders are of a kind no converter reads (`drawable`, `font`, `layout`, `mipmap`, `navigation`, `values` are), so nothing was generated from them: res/raw: alarm.m4a, anticipate.m4a, bell.m4a, birdsong.m4a, bloom.m4a, calypso.m4a, chime.m4a, choo.m4a, descent.m4a, electronic.m4a, fanfare.m4a, glass.m4a, gotosleep.m4a, healthnotification.m4a, horn.m4a, ladder.m4a, mailsent.m4a, minuet.m4a, multiwayinvitation.m4a, newmail.m4a, newsflash.m4a, noir.m4a, paymentsuccess.m4a, shake.m4a, sherwoodforest.m4a, silence.m4a, spell.m4a, suspense.m4a, telegraph.m4a, tiptoes.m4a, typewriters.m4a, update.m4a.
- **[Medium]** Info.plist NSCameraUsageDescription placeholder — `NSCameraUsageDescription` was added to Info.plist because the manifest declares `android.permission.CAMERA`. Its usage string is a PLACEHOLDER: "BarkAndroid uses the camera to ... (placeholder: reword this)". iOS shows it in the permission prompt and App Store review reads it, so reword it to say why the app needs the camera.

## Deployment target

`IPHONEOS_DEPLOYMENT_TARGET = 16.0`.

- The source declares `minSdk = 31`, which maps to iOS 15 by release year; `IPHONEOS_DEPLOYMENT_TARGET` stays at the 16.0 default.
- `DEVELOPMENT_TEAM` is not set because the source project declares none: choose a Team under Signing & Capabilities in Xcode before a device or CI build.

## CryptoSettingControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\CryptoSettingControllerScreen.kt`)_

Generated: `CryptoSettingControllerScreenView.swift`

- **[Medium]** viewModel: hiltViewModel() → @StateObject — `viewModel: CryptoSettingViewModel = hiltViewModel()` is now a `@StateObject` owning the translated `CryptoSettingViewModel` (CryptoSettingViewModel.swift), built by `CryptoSettingViewModel.make(...)`, which takes its dependencies from `AppDependencies` (Hilt/Koin wiring isn't translated — implement those). It needs `dependencies: Any?` — the view takes them as init parameters.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** focusManager property — Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
- **[Low]** keyTextFieldFocus property — Local value `val keyTextFieldFocus = remember { FocusRequester() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `keyTextFieldFocus` are at least declared; replace its type and add the real logic manually.
- **[Low]** copyButtonTap property — Local value `val copyButtonTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `copyButtonTap` are at least declared; replace its type and add the real logic manually.
- **[Low]** doneButtonTap property — Local value `val doneButtonTap = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `doneButtonTap` are at least declared; replace its type and add the real logic manually.
- **[Medium]** SnackbarHost slot — Not converted: the Scaffold's `SnackbarHost` has no SwiftUI view this tool can wire up (the `showSnackbar` calls are ordinary code that would need an overlay driven by state), so it was left off; show the message with an overlay or an alert by hand.
- **[Medium]** .fillMaxWidth modifier — Compose's Modifier.fillMaxWidth() was translated to SwiftUI's .frame(maxWidth: .infinity) — the standard "expand to fill available space" idiom on each platform; verify the surrounding layout (a Row/Column vs HStack/VStack) actually gives this view room to expand into.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## EmptyRecentMessagesViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\EmptyRecentMessagesViewScreen.kt`)_

Generated: `EmptyRecentMessagesViewScreenView.swift`

- **[Low]** TODO view — Not in OneNative's component catalog — copied through as-is.

## HomeViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\HomeViewControllerScreen.kt`)_

Generated: `HomeViewControllerScreenView.swift`

- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Medium]** Scaffold composable — Not converted: `Scaffold` has no entry in OneNative's component catalog, so it was replaced by `EmptyView()` (its arguments and content are not carried over) instead of being written in the source spelling, which does not compile. Rebuild this part by hand.
- **[Medium]** Parser note — `items(listOf(
                Triple("AddServer".localized, "NewServerViewController",…, ...)` was preserved structurally as ForEach — verify SwiftUI ForEach iteration semantics.
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## MediumRecentMessagesViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\MediumRecentMessagesViewScreen.kt`)_

Generated: `MediumRecentMessagesViewScreenView.swift`

- **[Low]** TODO view — Not in OneNative's component catalog — copied through as-is.

## MessageListViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\MessageListViewControllerScreen.kt`)_

Generated: `MessageListViewControllerScreenView.swift`

- **[Medium]** viewModel: hiltViewModel() → @StateObject — `viewModel: MessageListViewModel = hiltViewModel()` is now a `@StateObject` owning the translated `MessageListViewModel` (MessageListViewModel.swift), built by `MessageListViewModel.make(...)`, which takes its dependencies from `AppDependencies` (Hilt/Koin wiring isn't translated — implement those).
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** focusManager property — Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
- **[Low]** tableViewDeleted property — Local value `val tableViewDeleted = remember { PublishRelay<Any?>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewDeleted` are at least declared; replace its type and add the real logic manually.
- **[Low]** tableViewLoadMore property — Local value `val tableViewLoadMore = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewLoadMore` are at least declared; replace its type and add the real logic manually.
- **[Low]** itemDeleteInGroupRelay property — Local value `val itemDeleteInGroupRelay = remember { PublishRelay<MessageItemModel>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `itemDeleteInGroupRelay` are at least declared; replace its type and add the real logic manually.
- **[Low]** refreshRelay property — Local value `val refreshRelay = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `refreshRelay` are at least declared; replace its type and add the real logic manually.
- **[Low]** initialLoadRelay property — Local value `val initialLoadRelay = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `initialLoadRelay` are at least declared; replace its type and add the real logic manually.
- **[Low]** reloadRelay property — Local value `val reloadRelay = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `reloadRelay` are at least declared; replace its type and add the real logic manually.
- **[Low]** clearRelay property — Local value `val clearRelay = remember { PublishRelay<MessageDeleteTimeRange>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clearRelay` are at least declared; replace its type and add the real logic manually.
- **[Low]** listState property — Local value `val listState = androidx.compose.foundation.lazy.rememberLazyListState()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `listState` are at least declared; replace its type and add the real logic manually.
- **[Medium]** SnackbarHost slot — Not converted: the Scaffold's `SnackbarHost` has no SwiftUI view this tool can wire up (the `showSnackbar` calls are ordinary code that would need an overlay driven by state), so it was left off; show the message with an overlay or an alert by hand.
- **[Medium]** OutlinedTextField -> TextField — Compose's OutlinedTextField(value:, onValueChange:, label:) was translated to SwiftUI's TextField(_:text:) — verify the binding writes back correctly and the label text matches (onValueChange's body wasn't re-parsed; only a plain `= it` assignment is assumed).
- **[Medium]** .fillMaxWidth modifier — Compose's Modifier.fillMaxWidth() was translated to SwiftUI's .frame(maxWidth: .infinity) — the standard "expand to fill available space" idiom on each platform; verify the surrounding layout (a Row/Column vs HStack/VStack) actually gives this view room to expand into.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Low]** tableViewSections view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .onChange — Compose's LaunchedEffect(listState) was rewritten to SwiftUI's .onChange(of: listState) { ... }, re-running whenever the watched value changes — verify the effect's timing matches (LaunchedEffect does not necessarily run on the exact same occasions onChange would, depending on the source's own logic).
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## MessageSettingsViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\MessageSettingsViewControllerScreen.kt`)_

Generated: `MessageSettingsViewControllerScreenView.swift`

- **[Medium]** viewModel: hiltViewModel() → @StateObject — `viewModel: MessageSettingsViewModel = hiltViewModel()` is now a `@StateObject` owning the translated `MessageSettingsViewModel` (MessageSettingsViewModel.swift), built by `MessageSettingsViewModel.make(...)`, which takes its dependencies from `AppDependencies` (Hilt/Koin wiring isn't translated — implement those).
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** focusManager property — Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
- **[Low]** tableViewSelected property — Local value `val tableViewSelected = remember { PublishRelay<Any?>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewSelected` are at least declared; replace its type and add the real logic manually.
- **[Low]** backupOrRestoreActionRelay property — Local value `val backupOrRestoreActionRelay = remember { PublishRelay<BackupOrRestoreActionEnum>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `backupOrRestoreActionRelay` are at least declared; replace its type and add the real logic manually.
- **[Low]** viewDidAppearEvent property — Local value `val viewDidAppearEvent = remember { PublishRelay<Unit>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `viewDidAppearEvent` are at least declared; replace its type and add the real logic manually.
- **[Medium]** SnackbarHost slot — Not converted: the Scaffold's `SnackbarHost` has no SwiftUI view this tool can wire up (the `showSnackbar` calls are ordinary code that would need an overlay driven by state), so it was left off; show the message with an overlay or an alert by hand.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Low]** tableViewSections view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

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
- **[Medium]** SnackbarHost slot — Not converted: the Scaffold's `SnackbarHost` has no SwiftUI view this tool can wire up (the `showSnackbar` calls are ordinary code that would need an overlay driven by state), so it was left off; show the message with an overlay or an alert by hand.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## SectionViewController_iPadScreen  _(from `app\src\main\java\com\onenative\bark\screens\SectionViewController_iPadScreen.kt`)_

Generated: `SectionViewControlleriPadScreenView.swift`

- **[Medium]** viewModel: hiltViewModel() → @StateObject — `viewModel: SectionViewModel = hiltViewModel()` is now a `@StateObject` owning the translated `SectionViewModel` (SectionViewModel.swift), built by `SectionViewModel.make(...)`, which takes its dependencies from `AppDependencies` (Hilt/Koin wiring isn't translated — implement those).
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** focusManager property — Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
- **[Medium]** SnackbarHost slot — Not converted: the Scaffold's `SnackbarHost` has no SwiftUI view this tool can wire up (the `showSnackbar` calls are ordinary code that would need an overlay driven by state), so it was left off; show the message with an overlay or an alert by hand.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Low]** tableViewSections view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## ServerListViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\ServerListViewControllerScreen.kt`)_

Generated: `ServerListViewControllerScreenView.swift`

- **[Medium]** viewModel: hiltViewModel() → @StateObject — `viewModel: ServerListViewModel = hiltViewModel()` is now a `@StateObject` owning the translated `ServerListViewModel` (ServerListViewModel.swift), built by `ServerListViewModel.make(...)`, which takes its dependencies from `AppDependencies` (Hilt/Koin wiring isn't translated — implement those).
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** focusManager property — Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
- **[Medium]** SnackbarHost slot — Not converted: the Scaffold's `SnackbarHost` has no SwiftUI view this tool can wire up (the `showSnackbar` calls are ordinary code that would need an overlay driven by state), so it was left off; show the message with an overlay or an alert by hand.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Low]** tableViewSections view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## SmallRecentMessagesViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\SmallRecentMessagesViewScreen.kt`)_

Generated: `SmallRecentMessagesViewScreenView.swift`

- **[Low]** TODO view — Not in OneNative's component catalog — copied through as-is.

## SoundsViewControllerScreen  _(from `app\src\main\java\com\onenative\bark\screens\SoundsViewControllerScreen.kt`)_

Generated: `SoundsViewControllerScreenView.swift`

- **[Medium]** viewModel: hiltViewModel() → @StateObject — `viewModel: SoundsViewModel = hiltViewModel()` is now a `@StateObject` owning the translated `SoundsViewModel` (SoundsViewModel.swift), built by `SoundsViewModel.make(...)`, which takes its dependencies from `AppDependencies` (Hilt/Koin wiring isn't translated — implement those). It needs `dependencies: Any?` — the view takes them as init parameters.
- **[Low]** snackbar property — Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
- **[Low]** scope property — Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
- **[Low]** uriHandler property — Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
- **[Low]** focusManager property — Local value `val focusManager = LocalFocusManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `focusManager` are at least declared; replace its type and add the real logic manually.
- **[Low]** tableViewSelected property — Local value `val tableViewSelected = remember { PublishRelay<Any?>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewSelected` are at least declared; replace its type and add the real logic manually.
- **[Low]** tableViewDeleted property — Local value `val tableViewDeleted = remember { PublishRelay<Any?>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `tableViewDeleted` are at least declared; replace its type and add the real logic manually.
- **[Low]** importSoundActionRelay property — Local value `val importSoundActionRelay = remember { PublishRelay<URL>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `importSoundActionRelay` are at least declared; replace its type and add the real logic manually.
- **[Medium]** SnackbarHost slot — Not converted: the Scaffold's `SnackbarHost` has no SwiftUI view this tool can wire up (the `showSnackbar` calls are ordinary code that would need an overlay driven by state), so it was left off; show the message with an overlay or an alert by hand.
- **[Medium]** List view — SwiftUI List and Compose LazyColumn differ in built-in styling/separators — verify visual parity.
- **[Low]** tableViewSections view — Not in OneNative's component catalog — copied through as-is.
- **[Medium]** LaunchedEffect -> .task — Compose's LaunchedEffect(Unit) was rewritten to SwiftUI's .task { ... } — verify this runs at the intended time (matches SwiftUI's .task/.onAppear semantics, both of which reverse-translate to this same Compose shape; picked .task since LaunchedEffect is already a coroutine scope, a closer structural match for likely-async bodies — switch to .onAppear manually if this body is purely synchronous).
- **[Low]** Parser note — Parsing stopped partway through a composable body — the remainder was copied verbatim for manual review.

## TimeBadgeViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\TimeBadgeViewScreen.kt`)_

Generated: `TimeBadgeViewScreenView.swift`

- **[Low]** .font modifier — `androidx.compose.ui.text.TextStyle(fontSize = 10.sp, fontWeight = FontWeight.Bold, fontFamily = androidx.compose.ui.text.font.FontFamily.SansSerif)` is not a recognized Compose typography token (MaterialTheme.typography.titleMedium, etc.) — copied through as-is; find an equivalent SwiftUI Font style manually.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.

## WidgetEntryViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\WidgetEntryViewScreen.kt`)_

Generated: `WidgetEntryViewScreenView.swift`

- **[Medium]** .fillMaxSize modifier — Compose's Modifier.fillMaxSize() was translated to SwiftUI's .frame(maxWidth: .infinity, maxHeight: .infinity) — the standard "expand to fill available space" idiom on each platform; verify the surrounding layout (a Row/Column vs HStack/VStack) actually gives this view room to expand into.

## WidgetHeaderViewScreen  _(from `app\src\main\java\com\onenative\bark\screens\WidgetHeaderViewScreen.kt`)_

Generated: `WidgetHeaderViewScreenView.swift`

- **[Low]** .font modifier — `androidx.compose.ui.text.TextStyle(fontSize = 13.sp, fontWeight = FontWeight.Bold, fontFamily = androidx.compose.ui.text.font.FontFamily.SansSerif)` is not a recognized Compose typography token (MaterialTheme.typography.titleMedium, etc.) — copied through as-is; find an equivalent SwiftUI Font style manually.
- **[Medium]** .foregroundColor modifier — SwiftUI applies foregroundColor as a modifier; Compose usually takes color as a direct Text/Icon parameter — verify placement.
- **[Low]** Parser note — `if (icon != null) { val icon = icon!! ... }` was recognized as the mechanical Kotlin translation of Swift's `if let icon = icon` optional binding, and rewritten back to that real shape — verify the null check and force-unwrap really were doing nothing else.

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

## ArchiveSettingCellViewModel  _(from `app\src\main\java\com\onenative\bark\screens\ArchiveSettingCellViewModel.kt`)_

Generated: `ArchiveSettingCellViewModel.swift`

- **[Low]** ArchiveSettingCellViewModel: ViewModel → ObservableObject — `ArchiveSettingCellViewModel` (from app\src\main\java\com\onenative\bark\screens\ArchiveSettingCellViewModel.kt) was translated except: `on` (the type `BehaviorRelay` isn't a primitive, collection or type declared in the project). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## CryptoSettingViewModel  _(from `app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt`)_

Generated: `CryptoSettingViewModel.swift`

- **[Low]** CryptoSettingViewModel: ViewModel → ObservableObject — `CryptoSettingViewModel` (from app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt) was translated except: `transform()` (an overridden function); `preservingIv()` (an infix call or unknown operator `to`). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## HomeViewModel  _(from `app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt`)_

Generated: `HomeViewModel.swift`

- **[Low]** HomeViewModel: ViewModel → ObservableObject — `HomeViewModel` (from app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt) was translated except: `transform()` (an overridden function); `sendTestPush()` (the type `Observable` isn't a primitive, collection or type declared in the project); `makeTestRequest()` (the type `Server` isn't a primitive, collection or type declared in the project); `makeExampleText()` (the call `TODO(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## MessageListViewModel  _(from `app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt`)_

Generated: `MessageListViewModel.swift`

- **[Low]** MessageListViewModel: ViewModel → ObservableObject — `MessageListViewModel` (from app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt) was translated except: `type` (the type `MessageListType` isn't a primitive, collection or type declared in the project); `groups` (the type `Results` isn't a primitive, collection or type declared in the project); `results` (the type `Results` isn't a primitive, collection or type declared in the project); `errorAlert` (the type `PublishRelay` isn't a primitive, collection or type declared in the project); `getResults()` (the type `Results` isn't a primitive, collection or type declared in the project); `getGroups()` (the type `Results` isn't a primitive, collection or type declared in the project); `getMessages()` (the type `Results` isn't a primitive, collection or type declared in the project); `transform()` (an overridden function); `reloadResults()` (`is`); `getListNextPage()` (an infix call or unknown operator `until`); `getGroupNextPage()` (an infix call or unknown operator `until`); `getPage()` (`is`). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## MessageSettingsViewModel  _(from `app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt`)_

Generated: `MessageSettingsViewModel.swift`

- **[Low]** MessageSettingsViewModel: ViewModel → ObservableObject — `MessageSettingsViewModel` (from app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt) was translated except: `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## MutableTextCellViewModel  _(from `app\src\main\java\com\onenative\bark\screens\MutableTextCellViewModel.kt`)_

Generated: `MutableTextCellViewModel.swift`

- **[Low]** MutableTextCellViewModel: ViewModel → ObservableObject — `MutableTextCellViewModel` (from app\src\main\java\com\onenative\bark\screens\MutableTextCellViewModel.kt) was translated except: `text` (the type `Driver` isn't a primitive, collection or type declared in the project). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## NewServerViewModel  _(from `app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt`)_

Generated: `NewServerViewModel.swift`

- **[Low]** NewServerViewModel: ViewModel → ObservableObject — `NewServerViewModel` (from app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt) was translated except: `pop` (the call `PublishRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## SectionViewModel  _(from `app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt`)_

Generated: `SectionViewModel.swift`

- **[Low]** SectionViewModel: ViewModel → ObservableObject — `SectionViewModel` (from app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt) was translated except: `initSectionItems()` (the type `Observable` isn't a primitive, collection or type declared in the project); `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## ServerListTableViewCellViewModel  _(from `app\src\main\java\com\onenative\bark\screens\ServerListTableViewCellViewModel.kt`)_

Generated: `ServerListTableViewCellViewModel.swift`

- **[Low]** ServerListTableViewCellViewModel: ViewModel → ObservableObject — `ServerListTableViewCellViewModel` (from app\src\main\java\com\onenative\bark\screens\ServerListTableViewCellViewModel.kt) was translated except: `name` (a property with no initializer); `key` (a property with no initializer); `state` (a property with no initializer); `init { }` (`this.name`). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## ServerListViewModel  _(from `app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt`)_

Generated: `ServerListViewModel.swift`

- **[Low]** ServerListViewModel: ViewModel → ObservableObject — `ServerListViewModel` (from app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt) was translated except: `serverStates` (the call `mutableMapOf(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## SoundCellViewModel  _(from `app\src\main\java\com\onenative\bark\screens\SoundCellViewModel.kt`)_

Generated: `SoundCellViewModel.swift`

- **[Low]** SoundCellViewModel: ViewModel → ObservableObject — `SoundCellViewModel` (from app\src\main\java\com\onenative\bark\screens\SoundCellViewModel.kt) was translated except: `name` (the call `BehaviorRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `duration` (the call `TODO(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `copyNameAction` (the call `PublishRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `playAction` (the call `PublishRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function); `init { }` (the name `name` isn't a local, parameter or member of this ViewModel). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## SoundsViewModel  _(from `app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt`)_

Generated: `SoundsViewModel.swift`

- **[Low]** SoundsViewModel: ViewModel → ObservableObject — `SoundsViewModel` (from app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt) was translated except: `getSounds()` (the type `android.net.Uri` isn't a primitive, collection or type declared in the project); `getFilesInDirectory()` (the type `android.net.Uri` isn't a primitive, collection or type declared in the project); `transform()` (an overridden function). Each is a `fatalError` stub or a TODO comment with the Kotlin kept beside it (never guessed). Implement the dependency protocols and `AppDependencies` too. The class needs Xcode 14.3+ (Swift 5.8).

## ViewModelTypes  _(from ``)_

Generated: `ViewModelTypes.swift`

- **[Medium]** CryptoSettingFields: data class → struct — `CryptoSettingFields` (from app\src\main\java\com\onenative\bark\screens\Algorithm.kt) was declared as a Swift struct with its stored properties.

## AppDependencies  _(from ``)_

Generated: `AppDependencies.swift`

- **[Low]** AppDependencies: crashes when the screen opens — This app crashes when the screen opens: `Server` (needed by `ServerListTableViewCellViewModel`) is still a `fatalError` provider: no `@Binds`, `@Provides` or `@Inject constructor` provides `Server`. Creating the ViewModel calls `fatalError`; implement each in AppDependencies.swift before running.

## AppShell  _(from `app\src\main\java\com\onenative\bark\AppShell.kt`)_

Generated: `AppShell.swift`

- **[Medium]** ShellTab: data class → struct — `ShellTab` (from app\src\main\java\com\onenative\bark\AppShell.kt) was declared as a Swift struct with its stored properties.

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

## MarkdownParser  _(from `app\src\main\java\com\onenative\bark\screens\MarkdownParser.kt`)_

Generated: `MarkdownParser.swift`

- **[Medium]** Configuration: data class → struct — `Configuration` (from app\src\main\java\com\onenative\bark\screens\MarkdownParser.kt) was declared as a Swift struct with its stored properties. Also: a companion object, init block, or nested type wasn't carried over.
- **[Medium]** AttributedStringWalker: data class → struct — `AttributedStringWalker` (from app\src\main\java\com\onenative\bark\screens\MarkdownParser.kt) was declared as a Swift struct; member bodies were translated statement by statement — verify behavior, especially collection and string methods. Also: `attributedString` wasn't carried over — a member with no type annotation isn't a recognized shape; a companion object, init block, or nested type wasn't carried over.

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
- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt) was declared as a Swift struct with its stored properties.
- **[Medium]** Output: data class → struct — `Output` (from app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt) was declared as a Swift struct with its stored properties.

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
- **[Low]** WidgetHistorySnapshot: data class → struct — `WidgetHistorySnapshot` (from app\src\main\java\com\onenative\bark\screens\WidgetHistoryModels.kt) was declared in Swift, but these members couldn't be translated and are `fatalError(...)` stubs with the Kotlin kept in a comment: var availableGroups: [String] (an `if`/`when` shape this translator doesn't recognize (only `if (cond) { }` and `when (subject) { }` AS STATEMENTS, not as expressions, are supported)). Also: `recentMessages` wasn't carried over — one of its parameters (`limit: Int = WidgetHistoryConstants.displayLimit`) isn't a recognized shape (a defaulted parameter isn't attempted by this pass); a companion object, init block, or nested type wasn't carried over.

## Geometry  _(from `app\src\main\java\com\onenative\bark\support\Geometry.kt`)_

Generated: `Geometry.swift`

- **[Medium]** CGPoint: data class → struct — `CGPoint` (from app\src\main\java\com\onenative\bark\support\Geometry.kt) was declared as a Swift struct with its stored properties. Also: `offsetBy` wasn't carried over — a method with no body isn't a recognized shape; a companion object, init block, or nested type wasn't carried over.
- **[Medium]** CGSize: data class → struct — `CGSize` (from app\src\main\java\com\onenative\bark\support\Geometry.kt) was declared as a Swift struct with its stored properties. Also: a companion object, init block, or nested type wasn't carried over.
- **[Low]** CGRect: data class → struct — `CGRect` (from app\src\main\java\com\onenative\bark\support\Geometry.kt) was declared in Swift, but these members couldn't be translated and are `fatalError(...)` stubs with the Kotlin kept in a comment: func intersection(rect: CGRect) -> CGRect (an `if`/`else` with no block body). Also: `insetBy` wasn't carried over — a method with no body isn't a recognized shape; `offsetBy` wasn't carried over — a method with no body isn't a recognized shape; `inset` wasn't carried over — a method with no body isn't a recognized shape; `contains` wasn't carried over — a method with no body isn't a recognized shape; `contains` wasn't carried over — a method with no body isn't a recognized shape; `intersects` wasn't carried over — a method with no body isn't a recognized shape; a companion object, init block, or nested type wasn't carried over.
- **[Medium]** UIEdgeInsets: data class → struct — `UIEdgeInsets` (from app\src\main\java\com\onenative\bark\support\Geometry.kt) was declared as a Swift struct with its stored properties. Also: a companion object, init block, or nested type wasn't carried over.

## Http  _(from `app\src\main\java\com\onenative\bark\support\Http.kt`)_

Generated: `Http.swift`

- **[Medium]** HttpRequest: data class → struct — `HttpRequest` (from app\src\main\java\com\onenative\bark\support\Http.kt) was declared as a Swift struct with its stored properties.

## ItemList  _(from `app\src\main\java\com\onenative\bark\support\ItemList.kt`)_

Generated: `ItemList.swift`

- **[Medium]** Header: data class → struct — `Header` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Footer: data class → struct — `Footer` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Disclosure: data class → struct — `Disclosure` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Toggle: data class → struct — `Toggle` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Action: data class → struct — `Action` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Check: data class → struct — `Check` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Input: data class → struct — `Input` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Peer: data class → struct — `Peer` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.
- **[Medium]** Conditional: data class → struct — `Conditional` (from app\src\main\java\com\onenative\bark\support\ItemList.kt) was declared as a Swift struct with its stored properties. Also: its conformance(s) to ItemListRow() weren't carried over — reverse interface translation isn't attempted by this pass.

## Rx  _(from `app\src\main\java\com\onenative\bark\support\Rx.kt`)_

Generated: `Rx.swift`

- **[Low]** Declaration not translated — `data class SectionModel<...>` isn't translated — a generic data class isn't attempted by this pass

## UIKit  _(from `app\src\main\java\com\onenative\bark\support\UIKit.kt`)_

Generated: `UIKit.swift`

- **[Medium]** HSB: data class → struct — `HSB` (from app\src\main\java\com\onenative\bark\support\UIKit.kt) was declared as a Swift struct with its stored properties.

