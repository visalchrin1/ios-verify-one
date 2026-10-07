import Foundation
import Combine

/// Translated by OneNative from the Kotlin ViewModel `MessageListViewModel` (app\src\main\java\com\onenative\bark\screens\MessageListViewModel.kt).
final class MessageListViewModel: ObservableObject {
    var sourceType: MessageSourceType = MessageSourceType.all
    var page: Int = 0
    let pageCount: Int = 20
    var searchText: String = ""

    init() {
    }

    // TODO(OneNative): `reloadResults` was not translated — `is`. The Kotlin it came from:
    //   fun reloadResults(filterGroups: List<String?>, searchText: String?) {
    //           this.searchText = searchText ?: ""
    //           results = getResults(filterGroups = filterGroups, searchText = searchText)
    //           run {
    //               val subject0 = sourceType
    //               if (subject0 is MessageSourceType.all) {
    //                   groups = getGroups()
    //               }
    //           }
    //       }
    func reloadResults(_ filterGroups: [String?], _ searchText: String?) {
        fatalError("TODO: port reloadResults from Kotlin")
    }

    // TODO(OneNative): `getListNextPage` was not translated — an infix call or unknown operator `until`. The Kotlin it came from:
    //   fun getListNextPage(page: Int, pageCount: Int): List<MessageListCellItem> {
    //           val result = results
    //           if (result == null) {
    //               return listOf()
    //           }
    //           val startIndex = page * pageCount
    //           val endIndex = minOf(startIndex + pageCount, result.count)
    //           if (!(endIndex > startIndex)) {
    //               return listOf()
    //           }
    //           var messages: MutableList<MessageListCellItem> = mutableListOf()
    //           for (i in startIndex until endIndex) {
    //               messages.add(MessageListCellItem.message(model = MessageItemModel(message = result[i])))
    //           }
    //           return messages
    //       }
    func getListNextPage(_ page: Int, _ pageCount: Int) -> [MessageListCellItem] {
        fatalError("TODO: port getListNextPage from Kotlin")
    }

    // TODO(OneNative): `getGroupNextPage` was not translated — an infix call or unknown operator `until`. The Kotlin it came from:
    //   fun getGroupNextPage(page: Int, pageCount: Int): List<MessageListCellItem> {
    //           val groups = groups
    //           if (groups == null) {
    //               return listOf()
    //           }
    //           val results = results
    //           if (results == null) {
    //               return listOf()
    //           }
    //           val startIndex = page * pageCount
    //           val endIndex = minOf(startIndex + pageCount, groups.count)
    //           if (!(endIndex > startIndex)) {
    //               return listOf()
    //           }
    //           var items: MutableList<MessageListCellItem> = mutableListOf()
    //           for (i in startIndex until endIndex) {
    //               val group = groups[i].group
    //               val messageResult = getMessages(`in` = results, group = group)
    //               var messages: MutableList<MessageItemModel> = mutableListOf()
    //               for (i in 0 until minOf(messageResult.count, 5)) {
    //                   messages.add(MessageItemModel(message = messageResult[i]))
    //               }
    //               if (messages.count == 1) {
    //                   items.add(MessageListCellItem.message(model = messages[0]))
    //               } else {
    //                   if (messages.count > 0) {
    //                       items.add(MessageListCellItem.messageGroup(name = group ?: "default".localized, totalCount = messageResult.count, messages = messages))
    //                   }
    //               }
    //           }
    //           return items
    //       }
    func getGroupNextPage(_ page: Int, _ pageCount: Int) -> [MessageListCellItem] {
        fatalError("TODO: port getGroupNextPage from Kotlin")
    }

    // TODO(OneNative): `getPage` was not translated — `is`. The Kotlin it came from:
    //   fun getPage(page: Int, pageCount: Int): List<MessageListCellItem> {
    //           run {
    //               val subject0 = this.sourceType
    //               if (subject0 is MessageSourceType.group) {
    //                   return getListNextPage(page = page, pageCount = pageCount)
    //               }
    //           }
    //           if (type == MessageListType.list || !searchText.isEmpty()) {
    //               return getListNextPage(page = page, pageCount = pageCount)
    //           }
    //           return getGroupNextPage(page = page, pageCount = pageCount)
    //       }
    func getPage(_ page: Int, _ pageCount: Int) -> [MessageListCellItem] {
        fatalError("TODO: port getPage from Kotlin")
    }

    func getNextPage() -> [MessageListCellItem] {
        do {
            defer {
                page += 1
            }
            return getPage(self.page, self.pageCount)
        }
    }

    // TODO(OneNative): `type` was not translated — the type `MessageListType` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `groups` was not translated — the type `Results` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `results` was not translated — the type `Results` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `errorAlert` was not translated — the type `PublishRelay` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `getResults()` was not translated — the type `Results` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `getGroups()` was not translated — the type `Results` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `getMessages()` was not translated — the type `Results` isn't a primitive, collection or type declared in the project

    // TODO(OneNative): `transform()` was not translated — an overridden function
}

extension MessageListViewModel {
    /// Builds the ViewModel the way Hilt/Koin did on Android: dependencies are looked up in `AppDependencies`.
    static func make() -> MessageListViewModel {
        MessageListViewModel()
    }
}
