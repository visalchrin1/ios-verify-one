import SwiftUI

struct SoundsViewControllerScreenView: View {
    // ONENATIVE-REVIEW (confidence: low): Local value `val context = LocalContext.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `context` are at least declared; replace its type and add the real logic manually.
    var context: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
    var scope: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
    var snackbar: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
    var clipboard: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
    var uriHandler: Any?
    @State private var version = 0
    // ONENATIVE-REVIEW (confidence: low): Local value `val defaults = remember { loadDefault(context) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `defaults` are at least declared; replace its type and add the real logic manually.
    var defaults: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val customs = remember(version) { loadCustom(context) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `customs` are at least declared; replace its type and add the real logic manually.
    var customs: Any?
    @State private var playing: String? = nil
    @State private var player: MediaPlayer? = nil
    // ONENATIVE-REVIEW (confidence: low): Local value `val wasPlaying = playing == key` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `wasPlaying` are at least declared; replace its type and add the real logic manually.
    var wasPlaying: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val picker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocument()) { uri: Uri? ->
    //         if (uri == null) return@rememberLauncherForActivityResult
    //         val name = context.contentResolver.query(uri, null, null, null, null)?.use { c ->
    //             val i = c.getColumnIndex(android.provider.OpenableColumns.DISPLAY_NAME)
    //             if (c.moveToFirst() && i >= 0) c.getString(i) else null
    //         } ?: "sound_${System.currentTimeMillis()}.m4a"
    //         context.contentResolver.openInputStream(uri)?.use { input -> File(customDir(), name).outputStream().use { input.copyTo(it) } }
    //         version++
    //     }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `picker` are at least declared; replace its type and add the real logic manually.
    var picker: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val state = rememberSwipeToDismissBoxState(confirmValueChange = { value ->
    //                         if (value == SwipeToDismissBoxValue.EndToStart) {
    //                             if (playing == "c-" + entry.name) stop()
    //                             entry.file?.delete()
    //                             version++
    //                             true
    //                         } else false
    //                     })` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `state` are at least declared; replace its type and add the real logic manually.
    var state: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val full = "uploadSoundNoticeFullText".localized` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `full` are at least declared; replace its type and add the real logic manually.
    var full: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val highlight = "uploadSoundNoticeHighlightText".localized` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `highlight` are at least declared; replace its type and add the real logic manually.
    var highlight: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val start = full.indexOf(highlight)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `start` are at least declared; replace its type and add the real logic manually.
    var start: Any?
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        VStack {
            fun()
            stop {
                player()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // ?.release(); player = null; playing = null
                EmptyView()
            }
            fun()
            play(key: String, entry: SoundEntry) {
                stop()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // if (wasPlaying) return
                //         try {
                //             val p = if (entry.rawId != null) MediaPlayer.create(context, entry.rawId) else MediaPlayer().apply { setDataSource(entry.file!!.path); prepare() }
                //             p.setOnCompletionListener { stop() }
                //             p.start()
                //             player = p
                //             playing = key
                //         } catch (e: Exception) { stop() }
                EmptyView()
            }
            fun()
            copyName(name: String) {
                clipboard()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .setText(AnnotatedString(name.trim())); scope.launch { snackbar.showSnackbar("Copy".localized) }
                EmptyView()
            }
            ZStack(Modifier.fillMaxSize().background(AssetColors.background.ResolveView())) {
                VStack(Modifier.fillMaxSize()) {
                    HStack(Modifier.fillMaxWidth().padding(start: 20, end: 8, top: 48, bottom: 8), verticalAlignment: Alignment.CenterVertically) {
                        Text("notificationSound".localized, Modifier.weight(1))
                            .font(.title)
                            .fontWeight(FontWeight.Bold)
                            .foregroundColor(AssetColors.grey_darken4.ResolveView())
                        Button(action: onBack) {
                            Icon(Icons.Filled.KeyboardArrowDown, contentDescription: "close".localized, tint: AssetColors.grey_darken4.ResolveView())
                        }
                    }
                    List {
                        Text("customSounds".localized, Modifier.padding(start: 12, top: 12, bottom: 8), fontSize: 14)
                            .foregroundColor(AssetColors.grey_darken3.ResolveView())
                        ForEach(customs, id: \.self) { entry in
                            SwipeToDismissBox(state: state, enableDismissFromStartToEnd: false, backgroundContent: {
                            Box(Modifier.fillMaxSize().background(Color(0xFFFF3B30)).padding(end: 20), contentAlignment: Alignment.CenterEnd) {
                                Icon(Icons.Filled.Delete, contentDescription: nil, tint: Color.white)
                            }
                        }) {
                                SoundRow(entry, playing == "c-" + entry.name, { play("c-" + entry.name, entry) }, { copyName(entry.name) })
                            }
                            Divider()
                                .foregroundColor(AssetColors.grey_lighten3.ResolveView())
                        }
                        HStack(Modifier.fillMaxWidth().height(44).background(AssetColors.background_seconday.ResolveView()).clickable { picker.launch(arrayOf("audio/*")) }, verticalAlignment: Alignment.CenterVertically, horizontalArrangement: Arrangement.Center) {
                            Icon(Icons.Filled.MusicNote, contentDescription: nil, tint: AssetColors.lightBlue_darken3.ResolveView())
                                .frame(width: 20, height: 20)
                            Text("uploadSound".localized, Modifier.padding(start: 6), fontSize: 16)
                                .foregroundColor(AssetColors.lightBlue_darken3.ResolveView())
                        }
                        Text(buildAnnotatedString {
                            append(full)
                            if (start >= 0) addStyle(SpanStyle(color: AssetColors.lightBlue_darken3.ResolveView()), start, start + highlight.count)
                        }, Modifier.padding(start: 12, end: 12, top: 12, bottom: 8).clickable { uriHandler.openSafe("https://convertio.co/mp3-caf/") }, fontSize: 14)
                            .foregroundColor(AssetColors.grey_darken3.ResolveView())
                        Text("defaultSounds".localized, Modifier.padding(start: 12, top: 12, bottom: 8), fontSize: 14)
                            .foregroundColor(AssetColors.grey_darken3.ResolveView())
                        ForEach(defaults, id: \.self) { entry in
                            SoundRow(entry, playing == "d-" + entry.name, { play("d-" + entry.name, entry) }, { copyName(entry.name) })
                            Divider()
                                .foregroundColor(AssetColors.grey_lighten3.ResolveView())
                        }
                        ZStack(Modifier.height(24))
                    }
                }
                SnackbarHost(snackbar, Modifier.align(Alignment.BottomCenter).padding(bottom: 16))
            }
        }
            .onDisappear {
                player?.release()
            }
    }
}
