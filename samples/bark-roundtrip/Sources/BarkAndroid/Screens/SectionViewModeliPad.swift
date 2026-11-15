struct SectionItem {
    let image: UIImage?
    let title: String
}

struct Input {
}

struct Output {
    let items: Observable<List<SectionModel<String, SectionItem>>>
}

