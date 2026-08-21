import SVG_Standard
import Testing

extension SVG_Standard.Test.Integration.Performance {

    @Test(.timed(iterations: 100, warmup: 10))
    func `Circle creation`() {
        (0..<1000).forEach { i in
            let d = Double(i)
            let _ = SVG_Standard.Shapes.Circle(
                cx: .init(d),
                cy: .init(d),
                r: .init(Double(i % 100))
            )
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Line creation`() {
        (0..<1000).forEach { i in
            let d = Double(i)
            let _ = SVG_Standard.Shapes.Line(
                x1: .init(0),
                y1: .init(0),
                x2: .init(d),
                y2: .init(d)
            )
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Length description for all unit types`() {
        let lengths: [SVG_Standard.Types.Length] = [
            .px(100), .em(2), .ex(1), .pt(12), .pc(6),
            .mm(10), .cm(5), .in(1), .percentage(50), .number(42),
        ]
        (0..<1000).forEach { _ in
            lengths.forEach { length in
                _ = length.description
            }
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `ViewBox description`() {
        (0..<1000).forEach { i in
            let d = Double(i)
            let vb = SVG_Standard.Types.ViewBox(
                width: .init(d),
                height: .init(d)
            )
            _ = vb.description
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `Transform description for all variants`() {
        let transforms: [SVG_Standard.Types.Transform] = [
            .translate(x: .init(10), y: .init(20)),
            .rotate(angle: .init(45)),
            .rotate(angle: .init(90), cx: .init(50), cy: .init(50)),
            .scale(x: 2),
            .scale(x: 2, y: 3),
            .skewX(angle: .init(30)),
            .skewY(angle: .init(15)),
            .matrix(a: 1, b: 0, c: 0, d: 1, e: 0, f: 0),
        ]
        (0..<1000).forEach { _ in
            transforms.forEach { transform in
                _ = transform.description
            }
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `SVG document creation with viewBox`() {
        (0..<1000).forEach { i in
            let d = Double(i + 1)
            let vb = SVG_Standard.Types.ViewBox(
                width: .init(d),
                height: .init(d)
            )
            let _ = SVG_Standard.Document.SVG(
                width: .number(d),
                height: .number(d),
                viewBox: vb
            )
        }
    }

    @Test(.timed(iterations: 100, warmup: 10))
    func `LinearGradient creation with all properties`() {
        (0..<1000).forEach { _ in
            let _ = SVG_Standard.PaintServers.LinearGradient(
                id: "gradient",
                x1: "0%",
                y1: "0%",
                x2: "100%",
                y2: "100%",
                gradientUnits: .objectBoundingBox,
                spreadMethod: .pad
            )
        }
    }
}
