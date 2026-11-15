import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `MutableTextCellViewModel` (app\src\main\java\com\onenative\bark\screens\MutableTextCellViewModel.kt).
final class MutableTextCellViewModel: ObservableObject {
    var title: String

    init(title: String) {
        self.title = title

    }

    // TODO(OneNative): `text` was not translated — the type `Driver` isn't a primitive, collection or type declared in the project
}

extension MutableTextCellViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make(title: String) -> MutableTextCellViewModel {
        MutableTextCellViewModel(title: title)
    }
}
