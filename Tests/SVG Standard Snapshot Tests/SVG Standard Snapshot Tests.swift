// SVG Standard Snapshot Tests.swift
// SVG Standard Snapshot Tests

import SVG_Standard
import Testing

@Suite(.serialized)
struct SVGStandardSnapshotTests {

    @Test
    func `Circle description`() {
        let circle = SVG_Standard.Shapes.Circle(cx: .init(50), cy: .init(50), r: .init(40))
        #snapshot("\(circle)", as: .lines)
    }

    @Test
    func `Line description`() {
        let line = SVG_Standard.Shapes.Line(
            x1: .init(0),
            y1: .init(0),
            x2: .init(100),
            y2: .init(100)
        )
        #snapshot("\(line)", as: .lines)
    }

    @Test
    func `Length all unit descriptions`() {
        let lengths: [SVG_Standard.Types.Length] = [
            .number(42),
            .px(100),
            .em(2.5),
            .ex(1),
            .pt(12),
            .pc(6),
            .mm(10),
            .cm(5),
            .in(1),
            .percentage(50),
        ]
        let output = lengths.map(\.description).joined(separator: "\n")
        #snapshot(output, as: .lines)
    }

    @Test
    func `ViewBox description`() {
        let vb = SVG_Standard.Types.ViewBox(
            minX: .init(10),
            minY: .init(20),
            width: .init(300),
            height: .init(400)
        )
        #snapshot(vb.description, as: .lines)
    }

    @Test
    func `Transform all variants descriptions`() {
        let transforms: [SVG_Standard.Types.Transform] = [
            .translate(x: .init(10), y: .init(20)),
            .rotate(angle: .init(45)),
            .rotate(angle: .init(90), cx: .init(50), cy: .init(50)),
            .scale(x: 2),
            .scale(x: 2, y: 3),
            .skewX(angle: .init(30)),
            .skewY(angle: .init(15)),
            .matrix(a: 1, b: 0, c: 0, d: 1, e: 10, f: 20),
        ]
        let output = transforms.map(\.description).joined(separator: "\n")
        #snapshot(output, as: .lines)
    }

    @Test
    func `LineCap raw values`() {
        let caps: [SVG_Standard.Painting.LineCap] = [.butt, .round, .square]
        let output = caps.map(\.rawValue).joined(separator: "\n")
        #snapshot(output, as: .lines)
    }

    @Test
    func `LineJoin raw values`() {
        let joins: [SVG_Standard.Painting.LineJoin] = [.miter, .round, .bevel]
        let output = joins.map(\.rawValue).joined(separator: "\n")
        #snapshot(output, as: .lines)
    }

    @Test
    func `FillRule raw values`() {
        let rules: [SVG_Standard.Painting.FillRule] = [.nonzero, .evenodd]
        let output = rules.map(\.rawValue).joined(separator: "\n")
        #snapshot(output, as: .lines)
    }
}
