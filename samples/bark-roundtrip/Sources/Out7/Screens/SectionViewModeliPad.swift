struct SectionItem {
    let image: Any?
    let title: String
}

struct Output {
    let items: Observable<List<SectionModel<String, SectionItem>>>
}

