//
//  SVG_Standard_Tests.swift
//  swift-svg-standard
//
//  Basic smoke tests to verify re-export functionality
//

import Testing
import W3C_SVG

@Suite("SVG Standard - Re-export Verification")
struct SVG_Standard_Tests {

    @Test("W3C_SVG2 namespace accessible")
    func namespaceAccessible() {
        // Verify we can access W3C_SVG2 types through the re-export
        let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
        #expect(circle.cx == 50)
        #expect(circle.cy == 50)
        #expect(circle.r == 40)
    }

    @Test("Types namespace accessible")
    func typesAccessible() {
        let length = W3C_SVG2.Types.Length.px(100)
        #expect(length.stringValue == "100.0px")
    }

    @Test("PaintServers namespace accessible")
    func paintServersAccessible() {
        let gradient = W3C_SVG2.PaintServers.LinearGradient(id: "test")
        #expect(gradient.id == "test")
    }

    @Test("Document namespace accessible")
    func documentAccessible() {
        let svg = W3C_SVG2.Document.SVG(width: 100, height: 100)
        #expect(svg.width == 100)
    }

    @Test("Painting namespace accessible")
    func paintingAccessible() {
        let lineCap = W3C_SVG2.Painting.LineCap.round
        #expect(lineCap.rawValue == "round")
    }

    @Test("Text namespace accessible")
    func textAccessible() {
        let text = W3C_SVG2.Text.Text(content: "Hello")
        #expect(text.content == "Hello")
    }
}
