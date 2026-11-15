import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `SoundCellViewModel` (app\src\main\java\com\onenative\bark\screens\SoundCellViewModel.kt).
final class SoundCellViewModel: ObservableObject {
    let model: Any?

    init(model: Any?) {
        self.model = model
    }

    // TODO(OneNative): `name` was not translated — the call `BehaviorRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function

    // TODO(OneNative): `duration` was not translated — the call `TODO(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function

    // TODO(OneNative): `copyNameAction` was not translated — the call `PublishRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function

    // TODO(OneNative): `playAction` was not translated — the call `PublishRelay(…)` isn't a function of this ViewModel, a dependency method, a project type or a supported stdlib function

    // TODO(OneNative): the Kotlin `init { }` block was not translated — the name `name` isn't a local, parameter or member of this ViewModel
    //   name.accept(model.url.deletingPathExtension().lastPathComponent)
    //           duration.accept(model.duration)
}

extension SoundCellViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make(model: Any?) -> SoundCellViewModel {
        SoundCellViewModel(model: model)
    }
}
