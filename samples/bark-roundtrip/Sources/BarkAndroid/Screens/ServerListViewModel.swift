import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `ServerListViewModel` (app\src\main\java\com\onenative\bark\screens\ServerListViewModel.kt).
final class ServerListViewModel: ObservableObject {

    init() {
    }

    // TODO(OneNative): `serverStates` was not translated — the call `mutableMapOf(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function

    // TODO(OneNative): `transform()` was not translated — an overridden function
}

extension ServerListViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make() -> ServerListViewModel {
        ServerListViewModel()
    }
}
