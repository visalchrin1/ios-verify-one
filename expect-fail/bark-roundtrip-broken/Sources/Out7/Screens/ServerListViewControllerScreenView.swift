import SwiftUI

struct ServerListViewControllerScreenView: View {
    // ONENATIVE-REVIEW (confidence: low): Local value `val context = LocalContext.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `context` are at least declared; replace its type and add the real logic manually.
    var context: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val scope = rememberCoroutineScope()` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `scope` are at least declared; replace its type and add the real logic manually.
    var scope: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val snackbar = remember { SnackbarHostState() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `snackbar` are at least declared; replace its type and add the real logic manually.
    var snackbar: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val clipboard = LocalClipboardManager.current` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `clipboard` are at least declared; replace its type and add the real logic manually.
    var clipboard: Any?
    @State private var version = 0
    // ONENATIVE-REVIEW (confidence: low): Local value `val states = remember { mutableStateMapOf<String, Boolean>() }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `states` are at least declared; replace its type and add the real logic manually.
    var states: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val servers = ServerManager.shared.servers.toList().also { version }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `servers` are at least declared; replace its type and add the real logic manually.
    var servers: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val alert = UIAlertController(null, message, UIAlertControllerStyle.Alert)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `alert` are at least declared; replace its type and add the real logic manually.
    var alert: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val sheet = UIAlertController(null, server.host, UIAlertControllerStyle.ActionSheet)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `sheet` are at least declared; replace its type and add the real logic manually.
    var sheet: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val state = states[server.id]` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `state` are at least declared; replace its type and add the real logic manually.
    var state: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val name = server.host.ifEmpty { "Invalid Server" }.let { host -> if (!server.name.isNullOrEmpty()) server.name + "\n" + host else host }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `name` are at least declared; replace its type and add the real logic manually.
    var name: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val res = context.resources.getIdentifier(if (state == false) "offline" else "online", "drawable", context.packageName)` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `res` are at least declared; replace its type and add the real logic manually.
    var res: Any?
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
            confirmAlert(message: String, destructive: Boolean, onConfirm: () -> Unit) {
                alert()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .addAction(UIAlertAction("confirm".localized, if (destructive) UIAlertActionStyle.Destructive else UIAlertActionStyle.Default) { onConfirm() })
                //         alert.addAction(UIAlertAction("Cancel".localized, UIAlertActionStyle.Cancel))
                //         UiAlerts.present(alert)
                EmptyView()
            }
            fun()
            showActions(server: Server) {
                sheet()
                // ONENATIVE-REVIEW (confidence: low): unparsed source, copy/fix manually:
                // .addAction(UIAlertAction("copyAddressAndKey".localized) {
                //             clipboard.setText(AnnotatedString("${server.address}/${server.key}/"))
                //             toast("Copy".localized)
                //         })
                //         sheet.addAction(UIAlertAction("resetKey".localized) {
                //             val alert = UIAlertController("resetKey".localized, "resetKeyDesc".localized, UIAlertControllerStyle.Alert)
                //             alert.addTextField { it.placeholder = "resetKeyPlaceholder".localized }
                //             alert.addAction(UIAlertAction("confirm".localized) {
                //                 // Re-registering a key needs the device's push token (APNs on iOS, FCM on Android), which this build does not have.
                //                 toast("resetFailed2".localized)
                //             })
                //             alert.addAction(UIAlertAction("Cancel".localized, UIAlertActionStyle.Cancel))
                //             UiAlerts.present(alert)
                //         })
                //         sheet.addAction(UIAlertAction("setAsDefaultServer".localized) {
                //             ServerManager.shared.setCurrentServer(server.id)
                //             version++
                //         })
                //         sheet.addAction(UIAlertAction("setServerName".localized) {
                //             val alert = UIAlertController("setServerName".localized, null, UIAlertControllerStyle.Alert)
                //             alert.addTextField { it.text = server.name }
                //             alert.addAction(UIAlertAction("confirm".localized) {
                //                 ServerManager.shared.setServerName(server, alert.textFields.firstOrNull()?.text)
                //                 version++
                //             })
                //             alert.addAction(UIAlertAction("Cancel".localized, UIAlertActionStyle.Cancel))
                //             UiAlerts.present(alert)
                //         })
                //         sheet.addAction(UIAlertAction("deleteServer".localized, UIAlertActionStyle.Destructive) {
                //             confirmAlert("confirmDeleteServer".localized, true) {
                //                 if (ServerManager.shared.servers.size > 1) {
                //                     ServerManager.shared.removeServer(server)
                //                     version++
                //                     toast("deletedSuccessfully".localized)
                //                 } else {
                //                     toast("deleteFailed".localized)
                //                 }
                //             }
                //         })
                //         sheet.addAction(UIAlertAction("Cancel".localized, UIAlertActionStyle.Cancel))
                //         UiAlerts.present(sheet)
                EmptyView()
            }
            ZStack(Modifier.fillMaxSize().background(AssetColors.background.ResolveView())) {
                VStack(Modifier.fillMaxSize()) {
                    HStack(Modifier.fillMaxWidth().padding(start: 20, end: 8, top: 48, bottom: 8), verticalAlignment: Alignment.CenterVertically) {
                        Text("serverList".localized, Modifier.weight(1))
                            .font(.title)
                            .fontWeight(FontWeight.Bold)
                            .foregroundColor(AssetColors.grey_darken4.ResolveView())
                        Button(action: onBack) {
                            Icon(Icons.Filled.KeyboardArrowDown, contentDescription: "close".localized, tint: AssetColors.grey_darken4.ResolveView())
                        }
                    }
                    List {
                        ForEach(servers, id: \.id) { server in
                            HStack(Modifier
                            .padding(horizontal: 18)
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(50))
                            .background(AssetColors.background_seconday.ResolveView())
                            .border(1, AssetColors.grey_lighten3.ResolveView(), RoundedCornerShape(50))
                            .clickable { showActions(server) }
                            .padding(horizontal: 13, vertical: 10), verticalAlignment: Alignment.CenterVertically) {
                                Icon(painterResource(res), contentDescription: nil, tint: androidx.compose.ui.graphics.Color.Unspecified)
                                    .frame(width: 30, height: 30)
                                    .opacity(state == nil ? 0.3 : 1)
                                VStack(Modifier.padding(start: 8)) {
                                    Text(name, fontSize: 14)
                                        .fontWeight(FontWeight.Medium)
                                        .foregroundColor(AssetColors.grey_darken4.ResolveView())
                                    Text(server.key.ifEmpty { "none" }, fontSize: 12)
                                        .foregroundColor(AssetColors.grey_darken4.ResolveView())
                                }
                            }
                        }
                    }
                }
                SnackbarHost(snackbar, Modifier.align(Alignment.BottomCenter).padding(bottom: 16))
            }
        }
            .onChange(of: servers.map { $0.id + $0.address }) {
                servers.forEach { server -> launch { states[server.id] = ping(server.address) } }
            }
    }
}
