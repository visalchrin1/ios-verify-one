import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `NewServerViewModel` (app\src\main\java\com\onenative\bark\screens\NewServerViewModel.kt).
final class NewServerViewModel: ObservableObject {
    var url: String = ""

    init() {
    }

    // TODO(OneNative): `pop` was not translated — the call `PublishRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function

    // TODO(OneNative): `transform()` was not translated — an overridden function
}

extension NewServerViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make() -> NewServerViewModel {
        NewServerViewModel()
    }
}
