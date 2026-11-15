import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `CryptoSettingViewModel` (app\src\main\java\com\onenative\bark\screens\CryptoSettingViewModel.kt).
final class CryptoSettingViewModel: ObservableObject {
    let dependencies: Any?

    init(dependencies: Any?) {
        self.dependencies = dependencies
    }

    // TODO(OneNative): `preservingIv` was not translated — an infix call or unknown operator `to`. The Kotlin it came from:
    //   fun preservingIv(fields: CryptoSettingFields): CryptoSettingFields {
    //           var fields = fields
    //           val iv = dependencies.settingFieldRelay.value?.iv
    //           if (iv == null) {
    //               return fields
    //           }
    //           val expect = mapOf("CBC" to 16, "GCM" to 12)[fields.mode] ?: 0
    //           fields.iv = if (iv.count == expect) iv else null
    //           return fields
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
