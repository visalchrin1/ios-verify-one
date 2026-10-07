import SwiftUI

struct MessageSettingsViewControllerScreenView: View {
    // ONENATIVE-REVIEW (confidence: low): Local value `val context = LocalContext.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `context` are at least declared; replace its type and add the real logic manually.
    var context: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
    var scope: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
    var snackbar: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val uriHandler = LocalUriHandler.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `uriHandler` are at least declared; replace its type and add the real logic manually.
    var uriHandler: Any?
    @State private var version = 0
    @State private var archive = ArchiveSettingManager.shared.isArchive
    // ONENATIVE-REVIEW (confidence: low): Local value `val count = remember(version) { HistoryMessageStore.all().size }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `count` are at least declared; replace its type and add the real logic manually.
    var count: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val exporter = rememberLauncherForActivityResult(ActivityResultContracts.CreateDocument("application/json")) { uri ->
    //         if (uri != null) context.contentResolver.openOutputStream(uri)?.use { it.write(exportJson().toByteArray()) }
    //     }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `exporter` are at least declared; replace its type and add the real logic manually.
    var exporter: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val importer = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocument()) { uri ->
    //         if (uri != null) {
    //             val text = context.contentResolver.openInputStream(uri)?.use { String(it.readBytes()) } ?: ""
    //             if (importJson(text)) { version++; toast("done".localized) } else toast("Error")
    //         }
    //     }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `importer` are at least declared; replace its type and add the real logic manually.
    var importer: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val sheet = UIAlertController(null, null, UIAlertControllerStyle.ActionSheet)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `sheet` are at least declared; replace its type and add the real logic manually.
    var sheet: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val versionName = try { context.packageManager.getPackageInfo(context.packageName, 0).let { "${it.versionName} (${it.longVersionCode})" } } catch (e: Exception) { "" }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `versionName` are at least declared; replace its type and add the real logic manually.
    var versionName: Any?
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        VStack {
            fun()
            toast(text: String) {
                scope()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .launch { snackbar.showSnackbar(text) }
                EmptyView()
            }
            fun()
            backupActions {
                sheet()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .addAction(UIAlertAction("export".localized) { exporter.launch("bark_messages_${SimpleDateFormat("yyyy_MM_dd_HH_mm_ss", Locale.getDefault()).format(Date())}.json") })
                //         sheet.addAction(UIAlertAction("import".localized) { importer.launch(arrayOf("application/json", "text/plain")) })
                //         sheet.addAction(UIAlertAction("Cancel".localized, UIAlertActionStyle.Cancel))
                //         UiAlerts.present(sheet)
                EmptyView()
            }
            ZStack(Modifier.fillMaxSize().background(AssetColors.background.ResolveView())) {
                VStack(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(top: 48, bottom: 24)) {
                    Text("settings".localized, Modifier.padding(start: 20, bottom: 8))
                        .font(.title)
                        .fontWeight(FontWeight.Bold)
                        .foregroundColor(AssetColors.grey_darken4.ResolveView())
                    SectionHeader("historyMessage".localized)
                    Row_("\("export".localized)/\("import".localized)", "\(count) \("items".localized)", AssetColors.blue_darken1.ResolveView(), onClick: ::backupActions)
                    Divider(Modifier.padding(start: 16))
                        .foregroundColor(AssetColors.grey_lighten3.ResolveView())
                    Row_("defaultArchiveSettings".localized, trailing: {
                    Switch(checked: archive, onCheckedChange: { archive = $0; ArchiveSettingManager.shared.isArchive = $0 })
                })
                    SectionFooter("archiveNote".localized)
                    SectionHeader("info".localized)
                    Row_("Device Token", "unknown".localized)
                    SectionFooter("buildDesc".localized)
                    SectionHeader("other".localized)
                    Row_("faq".localized, chevron: true, onClick: { uriHandler.openSafe("faqUrl".localized) })
                    Divider(Modifier.padding(start: 16))
                        .foregroundColor(AssetColors.grey_lighten3.ResolveView())
                    Row_("documentation".localized, chevron: true, onClick: { uriHandler.openSafe("docUrl".localized) })
                    Divider(Modifier.padding(start: 16))
                        .foregroundColor(AssetColors.grey_lighten3.ResolveView())
                    Row_("sourceCode".localized, chevron: true, onClick: { uriHandler.openSafe("https://github.com/Finb/Bark") })
                    VStack(Modifier.fillMaxWidth().padding(top: 24), horizontalAlignment: Alignment.CenterHorizontally) {
                        Text("\("version".localized) \(versionName)", fontSize: 12, textAlign: TextAlign.Center)
                            .foregroundColor(AssetColors.grey_darken1.ResolveView())
                        HStack(Modifier.padding(top: 6)) {
                            Text("privacyPolicy".localized, Modifier.clickable { uriHandler.openSafe("https://api.day.app/privacy") }, fontSize: 12, textDecoration: TextDecoration.Underline)
                                .foregroundColor(AssetColors.grey_darken1.ResolveView())
                            Text("  ·  ", fontSize: 12)
                                .foregroundColor(AssetColors.grey_darken1.ResolveView())
                            Text("userAgreement".localized, Modifier.clickable { uriHandler.openSafe("https://www.apple.com/legal/internet-services/itunes/dev/stdeula") }, fontSize: 12, textDecoration: TextDecoration.Underline)
                                .foregroundColor(AssetColors.grey_darken1.ResolveView())
                        }
                    }
                }
                SnackbarHost(snackbar, Modifier.align(Alignment.BottomCenter).padding(bottom: 16))
            }
        }
    }
}
