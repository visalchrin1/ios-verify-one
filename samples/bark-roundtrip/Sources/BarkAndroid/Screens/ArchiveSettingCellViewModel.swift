import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `ArchiveSettingCellViewModel` (app\src\main\java\com\onenative\bark\screens\ArchiveSettingCellViewModel.kt).
final class ArchiveSettingCellViewModel: ObservableObject {

    init() {

    }

    // TODO(OneNative): `on` was not translated — the type `BehaviorRelay` isn't a primitive, collection or type declared in the project
}

extension ArchiveSettingCellViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make() -> ArchiveSettingCellViewModel {
        ArchiveSettingCellViewModel()
    }
}
