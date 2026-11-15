import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `SectionViewModel` (app\src\main\java\com\onenative\bark\screens\SectionViewModeliPad.kt).
final class SectionViewModel: ObservableObject {

    init() {
    }

    // TODO(OneNative): `initSectionItems()` was not translated — the type `Observable` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `transform()` was not translated — an overridden function
}

extension SectionViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make() -> SectionViewModel {
        SectionViewModel()
    }
}
