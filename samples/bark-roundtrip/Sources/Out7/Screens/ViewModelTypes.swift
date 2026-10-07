import Foundation

struct CryptoSettingFields: Hashable {
    var algorithm: String
    var mode: String
    var padding: String
    var key: String?
    var iv: String? = nil
}

enum MessageListCellItem: Hashable {
    case message(model: Any)
    case messageGroup(name: String, totalCount: Int, messages: Any)
}

enum MessageSourceType: Hashable {
    case all
    case group(value: String?)
}

