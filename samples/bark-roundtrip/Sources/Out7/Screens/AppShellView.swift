import SwiftUI

struct AppShellView: View {
    @State private var navigationPath = NavigationPath()
    @SceneStorage("AppShell.navigationPath") private var navigationPathData: Data?
    // ONENATIVE-REVIEW (confidence: low): Local delegate `val backStack by nav.currentBackStackEntryAsState()` was not translated as a real binding — only `by remember { mutableStateOf(...) }}` (or its mutableIntStateOf/mutableLongStateOf/mutableFloatStateOf/mutableDoubleStateOf primitive variants) state round-trips to @State — a placeholder property was declared below so this screen's existing references to `backStack` are at least declared; replace its type and add the real delegate logic manually.
    var backStack: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val current = backStack?.destination?.route` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `current` are at least declared; replace its type and add the real logic manually.
    var current: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val routes = setOf<String>("HomeViewController", "MessageListViewController", "MessageSettingsViewController", "CryptoSettingController", "NewServerViewController", "ServerListViewController", "SoundsViewController")` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `routes` are at least declared; replace its type and add the real logic manually.
    var routes: Any?
    // ONENATIVE-REVIEW (confidence: low): Local value `val navigateTo: (String) -> Unit = { route -> if (route in routes) nav.navigate(route) }` was not translated as a real binding — only `remember { mutableStateOf(...) }` state round-trips to @State — a placeholder property was declared below so this screen's existing references to `navigateTo` are at least declared; replace its type and add the real logic manually.
    var navigateTo: Any?
    @Binding var startRoute: String?
    @Binding var startRequest: Int

    var body: some View {
        VStack {
            AlertHostView()
            Scaffold(bottomBar: {
            NavigationBar {
                shellTabs.forEach { tab ->
                    NavigationBarItem(
                        selected: current == tab.route,
                        onClick: {
                            nav.navigate(tab.route) {
                                popUpTo(nav.graph.findStartDestination().id) { saveState = true }
                                launchSingleTop = true
                                restoreState = true
                            }
                        },
                        icon: { Icon(tab.icon, contentDescription: nil) },
                        label: { Text(tab.label) },
                    )
                }
            }
        }, item: padding) {
                NavigationStack(path: $navigationPath) {
                    HomeViewControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                }
                .navigationDestination(for: AppShellRoute.self) { route in
                    switch route {
                    case .homeViewController:
                        HomeViewControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                    case .messageListViewController:
                        MessageListViewControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                    case .messageSettingsViewController:
                        MessageSettingsViewControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                    case .cryptoSettingController:
                        CryptoSettingControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                    case .newServerViewController:
                        NewServerViewControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                    case .serverListViewController:
                        ServerListViewControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                    case .soundsViewController:
                        SoundsViewControllerScreenView(onBack: { navigationPath.removeLast() }, navigate: navigateTo)
                    }
                }
                    .padding(padding)
                .onAppear {
                    if navigationPath.isEmpty, let saved = navigationPathData, let representation = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: saved) { navigationPath = NavigationPath(representation) }
                }
                .onChange(of: navigationPath) { _, newValue in
                    navigationPathData = newValue.codable.flatMap { try? JSONEncoder().encode($0) }
                }
            }
        }
            .onChange(of: startRoute) {
                if (startRoute != nil && startRoute in routes) { if (startRoute in shellTabs.map { $0.route }) nav.navigate(startRoute) { popUpTo(nav.graph.findStartDestination().id) { saveState = true }; launchSingleTop = true; restoreState = true } else nav.navigate(startRoute) { launchSingleTop = true } }
            }
    }
}

enum AppShellRoute: Hashable, Codable {
    case homeViewController
    case messageListViewController
    case messageSettingsViewController
    case cryptoSettingController
    case newServerViewController
    case serverListViewController
    case soundsViewController
}
