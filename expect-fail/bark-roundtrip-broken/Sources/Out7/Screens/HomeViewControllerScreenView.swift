import SwiftUI

struct HomeViewControllerScreenView: View {
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
    @State private var server = currentServerOrNull()
    @State private var type = 0
    // ONENATIVE-REVIEW (confidence: low): Local value `val selected = ExampleType.entries[type]` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `selected` are at least declared; replace its type and add the real logic manually.
    var selected: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val code = exampleText(selected, server)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `code` are at least declared; replace its type and add the real logic manually.
    var code: Any?
    @State private var notificationsEnabled = NotificationManagerCompat.from(context).areNotificationsEnabled()
    // ONENATIVE-REVIEW (confidence: low): Local value `val lifecycleOwner = androidx.lifecycle.compose.LocalLifecycleOwner.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `lifecycleOwner` are at least declared; replace its type and add the real logic manually.
    var lifecycleOwner: Any?
    @Binding var onBack: () -> Unit
    @Binding var navigate: (String) -> Unit

    var body: some View {
        VStack {
            // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
            // DisposableEffect(lifecycleOwner) {
            //         val observer = androidx.lifecycle.LifecycleEventObserver { _, event ->
            //             if (event == androidx.lifecycle.Lifecycle.Event.ON_RESUME) notificationsEnabled = NotificationManagerCompat.from(context).areNotificationsEnabled()
            //         }
            //         lifecycleOwner.lifecycle.addObserver(observer)
            //         onDispose { lifecycleOwner.lifecycle.removeObserver(observer) }
            //     }
            EmptyView()
            fun()
            toast(text: String)
            // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
            // = scope.launch { snackbar.showSnackbar(text) }
            //     fun copy(text: String) { clipboard.setText(AnnotatedString(text)); toast("Copy".localized) }
            //     fun openNotificationSettings() {
            //         val intent = Intent(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS).putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, context.packageName).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            //         context.startActivity(intent)
            //     }
            //     // HomeViewController.enableNotifications: ask first (Android 13+), and send the user to the system settings once they have said no.
            //     var asked by androidx.compose.runtime.saveable.rememberSaveable { mutableStateOf(false) }
            //     val permissionLauncher = androidx.activity.compose.rememberLauncherForActivityResult(androidx.activity.result.contract.ActivityResultContracts.RequestPermission()) { granted ->
            //         notificationsEnabled = granted || NotificationManagerCompat.from(context).areNotificationsEnabled()
            //     }
            //     fun enableNotifications() {
            //         if (Build.VERSION.SDK_INT >= 33 && !asked) { asked = true; permissionLauncher.launch(android.Manifest.permission.POST_NOTIFICATIONS) } else openNotificationSettings()
            //     }
            // 
            //     Box(Modifier.fillMaxSize().background(AssetColors.background.resolve())) {
            //         Column(Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(horizontal = 16.dp).padding(top = 48.dp, bottom = 32.dp), verticalArrangement = Arrangement.spacedBy(16.dp)) {
            //             Row(Modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
            //                 Text(server?.displayName ?: "Bark", Modifier.weight(1f).padding(start = 4.dp), style = MaterialTheme.typography.headlineMedium, fontWeight = FontWeight.Bold, color = AssetColors.grey_darken4.resolve())
            //                 IconButton(onClick = { navigate("NewServerViewController") }) { Icon(Icons.Filled.Add, contentDescription = "AddServer".localized, tint = AssetColors.grey_darken4.resolve()) }
            //             }
            // 
            //             // HomePermissionCard
            //             val orange = Color(0xFFFF9500)
            //             val green = Color(0xFF34C759)
            //             GlassCard {
            //                 Row(verticalAlignment = Alignment.CenterVertically) {
            //                     Box(Modifier.size(44.dp).clip(RoundedCornerShape(22.dp)).background((if (notificationsEnabled) green else orange).copy(alpha = 0.12f)), contentAlignment = Alignment.Center) {
            //                         Icon(if (notificationsEnabled) Icons.Filled.CheckCircle else Icons.Filled.NotificationsActive, contentDescription = null, tint = if (notificationsEnabled) green else orange)
            //                     }
            //                     Column(Modifier.weight(1f).padding(horizontal = 12.dp)) {
            //                         Text((if (notificationsEnabled) "notificationPermissionOn" else "notificationPermissionOff").localized, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.SemiBold)
            //                         Text((if (notificationsEnabled) "notificationPermissionOnDetail" else "notificationPermissionOffDetail").localized, style = MaterialTheme.typography.bodySmall, color = AssetColors.grey_darken1.resolve())
            //                     }
            //                     if (!notificationsEnabled) PillButton("goToSettings".localized) { enableNotifications() }
            //                 }
            //             }
            // 
            //             // HomeExampleCard
            //             GlassCard {
            //                 Column(verticalArrangement = Arrangement.spacedBy(14.dp)) {
            //                     Text("usageExamples".localized, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.SemiBold)
            //                     Column(
            //                         Modifier.fillMaxWidth().clip(RoundedCornerShape(14.dp)).background(AssetColors.home_code_panel.resolve()).padding(14.dp),
            //                     ) {
            //                         Row(Modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.SpaceBetween) {
            //                             Text("bash", style = TextStyle(fontFamily = FontFamily.Monospace, fontSize = 10.sp, fontWeight = FontWeight.SemiBold), color = AssetColors.grey_darken1.resolve())
            //                             Row(horizontalArrangement = Arrangement.spacedBy(14.dp)) {
            //                                 ExampleType.entries.forEachIndexed { index, t ->
            //                                     Text(
            //                                         t.label,
            //                                         Modifier.clickable { type = index }.padding(vertical = 6.dp, horizontal = 2.dp),
            //                                         style = TextStyle(fontFamily = FontFamily.Monospace, fontSize = 11.sp, fontWeight = FontWeight.SemiBold),
            //                                         color = if (index == type) AssetColors.black.resolve() else AssetColors.grey_lighten1.resolve(),
            //                                     )
            //                                 }
            //                             }
            //                         }
            //                         Spacer(Modifier.height(6.dp))
            //                         Text(highlighted(code), style = TextStyle(fontFamily = FontFamily.Monospace, fontSize = 12.sp, lineHeight = 17.sp), color = AssetColors.black.resolve())
            //                     }
            //                     Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
            //                         var menu by remember { mutableStateOf(false) }
            //                         Box(Modifier.weight(1f)) {
            //                             Row(
            //                                 Modifier.fillMaxWidth().height(44.dp).clip(RoundedCornerShape(22.dp)).background(AssetColors.home_legacy_button.resolve()).androidxBorder(AssetColors.home_legacy_border.resolve()),
            //                                 verticalAlignment = Alignment.CenterVertically,
            //                             ) {
            //                                 Text("Copy2".localized, Modifier.weight(1f).clickable { copy(code) }.padding(horizontal = 16.dp).padding(vertical = 12.dp), style = MaterialTheme.typography.bodyMedium)
            //                                 Box(Modifier.width(1.dp).height(24.dp).background(AssetColors.home_divider.resolve()))
            //                                 Box(Modifier.size(44.dp).clickable { menu = true }, contentAlignment = Alignment.Center) { Icon(Icons.Filled.KeyboardArrowDown, contentDescription = "MoreActions".localized, modifier = Modifier.size(20.dp)) }
            //                             }
            //                             val hasKey = !(server?.key.isNullOrEmpty())
            //                             DropdownMenu(expanded = menu, onDismissRequest = { menu = false }) {
            //                                 DropdownMenuItem(text = { Text("copyAddressAndKey".localized) }, enabled = hasKey, onClick = { menu = false; copy(server!!.addressAndKey) })
            //                                 DropdownMenuItem(text = { Text("copyKey".localized) }, enabled = hasKey, onClick = { menu = false; copy(server!!.key) })
            //                             }
            //                         }
            //                         PillButton("sendTest".localized, Icons.AutoMirrored.Filled.Send, Modifier.weight(1f)) {
            //                             if (!notificationsEnabled) { toast("notificationPermissionOff".localized); enableNotifications() }
            //                             else scope.launch { toast(sendTestPush(context, selected, server)) }
            //                         }
            //                     }
            //                 }
            //             }
            // 
            //             // HomeSettingsCard
            //             GlassCard {
            //                 Column {
            //                     SettingRow("serverList".localized, Icons.Filled.Dns, Color(0xFF007AFF), AssetColors.home_accent_blue.resolve()) { navigate("ServerListViewController") }
            //                     Divider44()
            //                     SettingRow("encryptionSettings".localized, Icons.Filled.Key, Color(0xFF30B0C7), AssetColors.home_accent_teal.resolve()) { navigate("CryptoSettingController") }
            //                     Divider44()
            //                     SettingRow("customSounds".localized, Icons.AutoMirrored.Filled.VolumeUp, orange, AssetColors.home_accent_orange.resolve()) { navigate("SoundsViewController") }
            //                 }
            //             }
            // 
            //             // HomeDocumentsCard
            //             GlassCard {
            //                 Column(verticalArrangement = Arrangement.spacedBy(14.dp)) {
            //                     Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
            //                         Text("documentsAndExamples".localized, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.SemiBold)
            //                         Text("documentsAndExamplesDetail".localized, style = MaterialTheme.typography.bodyMedium, color = AssetColors.grey_darken1.resolve())
            //                     }
            //                     Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
            //                         PillButton("pushParameters".localized, Icons.Filled.MenuBook, Modifier.weight(1f)) { uriHandler.openSafe("paramsUrl".localized) }
            //                         PillButton("faq".localized, Icons.AutoMirrored.Filled.HelpOutline, Modifier.weight(1f)) { uriHandler.openSafe("faqUrl".localized) }
            //                     }
            //                 }
            //             }
            //         }
            //         SnackbarHost(snackbar, Modifier.align(Alignment.BottomCenter).padding(bottom = 16.dp))
            //     }
            EmptyView()
        }
            .task {
                ServerManager.shared.currentServerUpdateRelay.asDriver().collect { server = $0 }
            }
    }
}
