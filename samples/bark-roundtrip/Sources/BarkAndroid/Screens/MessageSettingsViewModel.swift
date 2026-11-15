import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `MessageSettingsViewModel` (app\src\main\java\com\onenative\bark\screens\MessageSettingsViewModel.kt).
final class MessageSettingsViewModel: ObservableObject {

    init() {
    }

    // TODO(OneNative): `transform()` was not translated — an overridden function
}

extension MessageSettingsViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make() -> MessageSettingsViewModel {
        MessageSettingsViewModel()
    }
}
