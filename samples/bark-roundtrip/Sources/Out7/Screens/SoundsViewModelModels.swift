struct sound {
    let model: SoundCellViewModel
}

struct Input {
    let soundSelected: Driver<SoundItem>
    let importSound: Driver<URL>
    let soundDeleted: Driver<SoundItem>
}

struct Output {
    let audios: Observable<List<SectionModel<String, SoundItem>>>
    let copyNameAction: Driver<String>
    let playAction: Any?
    let pickerFile: Driver<Void>
}

