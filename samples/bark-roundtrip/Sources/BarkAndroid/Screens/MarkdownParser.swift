struct Configuration {
    let baseFont: Any?
    let baseColor: UIColor
    let linkColor: UIColor
    let codeTextColor: UIColor
    let codeBackgroundColor: UIColor
    let codeBlockTextColor: UIColor
    let quoteColor: UIColor
}

struct AttributedStringWalker {
    let configuration: MarkdownParser.Configuration
    var attributes: [NSAttributedString.Key: Any] = [:]
    var listStack: [Pair<ListType, Int>] = [:]

    // from AttributedStringWalker.visitDocument
    func visitDocument(document: Any?) {
        TODO("Port from Swift: visitDocument")
    }

    // from AttributedStringWalker.visitParagraph
    func visitParagraph(paragraph: Any?) {
        TODO("Port from Swift: visitParagraph")
    }

    // from AttributedStringWalker.visitText
    func visitText(text: Text) {
        TODO("Port from Swift: visitText")
    }

    // from AttributedStringWalker.visitStrong
    func visitStrong(strong: Any?) {
        TODO("Port from Swift: visitStrong")
    }

    // from AttributedStringWalker.visitEmphasis
    func visitEmphasis(emphasis: Any?) {
        TODO("Port from Swift: visitEmphasis")
    }

    // from AttributedStringWalker.visitStrikethrough
    func visitStrikethrough(strikethrough: Any?) {
        TODO("Port from Swift: visitStrikethrough")
    }

    // from AttributedStringWalker.visitLink
    func visitLink(link: Any?) {
        TODO("Port from Swift: visitLink")
    }

    // from AttributedStringWalker.visitInlineCode
    func visitInlineCode(inlineCode: Any?) {
        TODO("Port from Swift: visitInlineCode")
    }

    // from AttributedStringWalker.visitCodeBlock
    func visitCodeBlock(codeBlock: Any?) {
        TODO("Port from Swift: visitCodeBlock")
    }

    // from AttributedStringWalker.visitHeading
    func visitHeading(heading: Any?) {
        TODO("Port from Swift: visitHeading")
    }

    // from AttributedStringWalker.visitBlockQuote
    func visitBlockQuote(blockQuote: Any?) {
        TODO("Port from Swift: visitBlockQuote")
    }

    // from AttributedStringWalker.visitOrderedList
    func visitOrderedList(orderedList: Any?) {
        TODO("Port from Swift: visitOrderedList")
    }

    // from AttributedStringWalker.visitUnorderedList
    func visitUnorderedList(unorderedList: Any?) {
        TODO("Port from Swift: visitUnorderedList")
    }

    // from AttributedStringWalker.visitListItem
    func visitListItem(listItem: Any?) {
        TODO("Port from Swift: visitListItem")
    }

    // from AttributedStringWalker.visitImage
    func visitImage(image: Image) {
        TODO("Port from Swift: visitImage")
    }

    // from AttributedStringWalker.visitSoftBreak
    func visitSoftBreak(softBreak: Any?) {
        TODO("Port from Swift: visitSoftBreak")
    }

    // from AttributedStringWalker.visitLineBreak
    func visitLineBreak(lineBreak: Any?) {
        TODO("Port from Swift: visitLineBreak")
    }
}

