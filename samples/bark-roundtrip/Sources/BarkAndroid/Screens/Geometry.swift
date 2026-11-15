struct CGPoint {
    let x: Float = 0
    let y: Float = 0
}

struct CGSize {
    let width: Float = 0
    let height: Float = 0
}

struct CGRect {
    let x: Float = 0
    let y: Float = 0
    let width: Float = 0
    let height: Float = 0

    // from CGRect.origin
    var origin: CGPoint {
        CGPoint(x, y)
    }

    // from CGRect.size
    var size: CGSize {
        CGSize(width, height)
    }

    // from CGRect.minX
    var minX: Float {
        x
    }

    // from CGRect.midX
    var midX: Float {
        x + width / 2
    }

    // from CGRect.maxX
    var maxX: Float {
        x + width
    }

    // from CGRect.minY
    var minY: Float {
        y
    }

    // from CGRect.midY
    var midY: Float {
        y + height / 2
    }

    // from CGRect.maxY
    var maxY: Float {
        y + height
    }

    // from CGRect.center
    var center: CGPoint {
        CGPoint(midX, midY)
    }

    // from CGRect.isEmpty
    var isEmpty: Bool {
        width <= 0 || height <= 0
    }

    // from CGRect.integral
    var integral: CGRect {
        let left = Math.floor(x.toDouble()).toFloat()
        let top = Math.floor(y.toDouble()).toFloat()
        return CGRect(left, top, Math.ceil(maxX.toDouble()).toFloat() - left, Math.ceil(maxY.toDouble()).toFloat() - top)
    }

    // from CGRect.union
    func union(rect: CGRect) -> CGRect {
        let left = minOf(minX, rect.minX)
        let top = minOf(minY, rect.minY)
        return CGRect(left, top, maxOf(maxX, rect.maxX) - left, maxOf(maxY, rect.maxY) - top)
    }

    // from CGRect.intersection
    // ONENATIVE-REVIEW (confidence: low): not translated — an `if`/`else` with no block body. Original Kotlin:
    // if (!intersects(rect)) return CGRect()
    //         val left = maxOf(minX, rect.minX)
    //         val top = maxOf(minY, rect.minY)
    //         return CGRect(left, top, minOf(maxX, rect.maxX) - left, minOf(maxY, rect.maxY) - top)
    func intersection(rect: CGRect) -> CGRect {
        fatalError("TODO: port from Kotlin")
    }
}

struct UIEdgeInsets {
    let top: Float = 0
    let left: Float = 0
    let bottom: Float = 0
    let right: Float = 0
}

