//
//  SVG_Standard_Tests.swift
//  swift-svg-standard
//
//  Basic smoke tests to verify re-export functionality
//

import SVG_Standard
import Testing

@Suite("SVG Standard - Re-export Verification")
struct SVG_Standard_Tests {

    @Test("SVG_Standard namespace accessible")
    func namespaceAccessible() {
        // Verify we can access SVG_Standard types through the re-export
        let circle = SVG_Standard.Shapes.Circle(cx: 50, cy: 50, r: 40)
        #expect(circle.cx == 50)
        #expect(circle.cy == 50)
        #expect(circle.r == 40)
    }

    @Test("Types namespace accessible")
    func typesAccessible() {
        let length = SVG_Standard.Types.Length.px(100)
        #expect(length.stringValue == "100px")
    }

    @Test("PaintServers namespace accessible")
    func paintServersAccessible() {
        let gradient = SVG_Standard.PaintServers.LinearGradient(id: "test")
        #expect(gradient.id == "test")
    }

    @Test("Document namespace accessible")
    func documentAccessible() {
        let svg = SVG_Standard.Document.SVG(
            width: 100,
            height: 100
        )
        #expect(svg.width == 100)
    }

    @Test("Painting namespace accessible")
    func paintingAccessible() {
        let lineCap = SVG_Standard.Painting.LineCap.round
        #expect(lineCap.rawValue == "round")
    }

    @Test("Text namespace accessible")
    func textAccessible() {
        let text = SVG_Standard.Text.Text(content: "Hello")
        #expect(text.content == "Hello")
    }
}
