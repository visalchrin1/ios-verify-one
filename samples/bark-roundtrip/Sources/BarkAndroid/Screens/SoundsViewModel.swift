import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `SoundsViewModel` (app\src\main\java\com\onenative\bark\screens\SoundsViewModel.kt).
final class SoundsViewModel: ObservableObject {
    let dependencies: Any?

    init(dependencies: Any?) {
        self.dependencies = dependencies
    }

    // TODO(OneNative): `getSounds()` was not translated — the type `android.net.Uri` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `getFilesInDirectory()` was not translated — the type `android.net.Uri` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `transform()` was not translated — an overridden function
}

extension SoundsViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make(dependencies: Any?) -> SoundsViewModel {
        SoundsViewModel(dependencies: dependencies)
    }
}
