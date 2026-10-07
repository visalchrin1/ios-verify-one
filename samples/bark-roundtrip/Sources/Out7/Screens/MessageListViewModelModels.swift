struct Input {
    let initialLoad: Driver<Void>
    let refresh: Driver<Void>
    let loadMore: Driver<Void>
    let itemDelete: Driver<MessageListCellItem>
    let itemDeleteInGroup: Driver<MessageItemModel>
    let delete: Driver<MessageDeleteTimeRange>
    let groupToggleTap: Driver<Void>
    let searchText: Observable<String?>
    let reload: Driver<Void>
}

struct Output {
    let messages: Driver<List<MessageSection>>
    let refreshAction: Driver<MJRefreshAction>
    let type: Driver<MessageListType>
    let title: Driver<String>
    let groupToggleButtonHidden: Driver<Bool>
    let errorAlert: Driver<String>
}

