import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `HomeViewModel` (app\src\main\java\com\onenative\bark\screens\HomeViewModel.kt).
final class HomeViewModel: ObservableObject {

    init() {
    }

    // TODO(OneNative): `makeExampleText` was not translated — the call `TODO(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function. The Kotlin it came from:
    //   fun makeExampleText(`for`: Any?): String {
    //           TODO("Port from Swift: makeExampleText")
    //       }
    func makeExampleText(_ `for`: Any?) -> String {
        fatalError("TODO: port makeExampleText from Kotlin")
    }

    // TODO(OneNative): `transform()` was not translated — an overridden function

    // TODO(OneNative): `sendTestPush()` was not translated — the type `Observable` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `makeTestRequest()` was not translated — the type `Server` isn't a primitive, collection or type declared in the project
}

extension HomeViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make() -> HomeViewModel {
        HomeViewModel()
    }
}
