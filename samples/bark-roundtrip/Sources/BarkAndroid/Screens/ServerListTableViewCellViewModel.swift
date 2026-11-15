import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `ServerListTableViewCellViewModel` (app\src\main\java\com\onenative\bark\screens\ServerListTableViewCellViewModel.kt).
final class ServerListTableViewCellViewModel: ObservableObject {
    private let server: any Server

    init(server: any Server, state: Bool?) {
        self.server = server
    }

    // TODO(OneNative): `name` was not translated — a property with no initializer

    // TODO(OneNative): `key` was not translated — a property with no initializer

    // TODO(OneNative): `state` was not translated — a property with no initializer

    // TODO(OneNative): the Kotlin `init { }` block was not translated — `this.name`
    //   this.name = BehaviorRelay<String>(value = run {
    //               var serverName = urlOrNull(server.address)?.host ?: "Invalid Server"
    //               run {
    //                   val name = server.name
    //                   if (name != null && !name.isEmpty()) {
    //                       serverName = name + "\n" + serverName
    //                   }
    //               }
    //               serverName
    //           })
    //           this.key = BehaviorRelay<String>(value = if (!server.key.isEmpty()) server.key else "none")
    //           this.state = BehaviorRelay<Boolean?>(value = state)
}

extension ServerListTableViewCellViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make(state: Bool?) -> ServerListTableViewCellViewModel {
        ServerListTableViewCellViewModel(server: AppDependencies.server, state: state)
    }
}
