import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `CryptoSettingViewModel` (app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt).
final class CryptoSettingViewModel: ObservableObject {
    let dependencies: Any?

    init(dependencies: Any?) {
        self.dependencies = dependencies
    }

    // TODO(OneNative): `preservingIv` was not translated — the call `TODO(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function. The Kotlin it came from:
    //   fun preservingIv(fields: CryptoSettingFields): CryptoSettingFields {
    //           TODO("Port from Swift: preservingIv")
    //       }
    func preservingIv(_ fields: CryptoSettingFields) -> CryptoSettingFields {
        fatalError("TODO: port preservingIv from Kotlin")
    }

    // TODO(OneNative): `transform()` was not translated — an overridden function
}

extension CryptoSettingViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make(dependencies: Any?) -> CryptoSettingViewModel {
        CryptoSettingViewModel(dependencies: dependencies)
    }
}
