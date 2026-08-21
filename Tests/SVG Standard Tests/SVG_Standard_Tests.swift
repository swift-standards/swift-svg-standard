import SVG_Standard
import Testing

extension SVG_Standard {
    @Suite
    struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
        @Suite struct Integration {}
        @Suite(.serialized) struct Performance {}
    }
}

extension SVG_Standard.Test.Unit {

    @Test
    func `Circle stores center coordinates and radius`() {
        let circle = SVG_Standard.Shapes.Circle(cx: .init(50), cy: .init(50), r: .init(40))
        #expect(circle.cx == .init(50))
        #expect(circle.cy == .init(50))
        #expect(circle.r == .init(40))
    }

    @Test
    func `Circle default values are zero`() {
        let circle = SVG_Standard.Shapes.Circle()
        #expect(circle.cx == .init(0))
        #expect(circle.cy == .init(0))
        #expect(circle.r == .init(0))
    }

    @Test
    func `Circle tag name is circle`() {
        #expect(SVG_Standard.Shapes.Circle.tagName == "circle")
    }

    @Test
    func `Line stores start and end coordinates`() {
        let line = SVG_Standard.Shapes.Line(
            x1: .init(10),
            y1: .init(20),
            x2: .init(100),
            y2: .init(200)
        )
        #expect(line.x1 == .init(10))
        #expect(line.y1 == .init(20))
        #expect(line.x2 == .init(100))
        #expect(line.y2 == .init(200))
    }

    @Test
    func `Line tag name is line`() {
        #expect(SVG_Standard.Shapes.Line.tagName == "line")
    }

    @Test
    func `Rectangle tag name is rect`() {
        #expect(SVG_Standard.Shapes.Rectangle.tagName == "rect")
    }

    @Test
    func `Length px description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.px(100)
        #expect(length.description == "100px")
    }

    @Test
    func `Length em description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.em(2.5)
        #expect(length.description == "2.5em")
    }

    @Test
    func `Length percentage description includes percent sign`() {
        let length = SVG_Standard.Types.Length.percentage(50)
        #expect(length.description == "50%")
    }

    @Test
    func `Length pt description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.pt(12)
        #expect(length.description == "12pt")
    }

    @Test
    func `Length cm description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.cm(5)
        #expect(length.description == "5cm")
    }

    @Test
    func `Length mm description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.mm(10)
        #expect(length.description == "10mm")
    }

    @Test
    func `Length in description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.in(1)
        #expect(length.description == "1in")
    }

    @Test
    func `Length pc description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.pc(6)
        #expect(length.description == "6pc")
    }

    @Test
    func `Length ex description includes unit suffix`() {
        let length = SVG_Standard.Types.Length.ex(3)
        #expect(length.description == "3ex")
    }

    @Test
    func `Length number description is unitless`() {
        let length = SVG_Standard.Types.Length.number(42)
        #expect(length.description == "42")
    }

    @Test
    func `Length from integer literal creates number case`() {
        let length: SVG_Standard.Types.Length = 100
        #expect(length == .number(100))
    }

    @Test
    func `Length from float literal creates number case`() {
        let length: SVG_Standard.Types.Length = 3.14
        #expect(length == .number(3.14))
    }

    @Test
    func `ViewBox stores min coordinates and dimensions`() {
        let vb = SVG_Standard.Types.ViewBox(width: .init(200), height: .init(100))
        #expect(vb.minX == .zero)
        #expect(vb.minY == .zero)
        #expect(vb.width == .init(200))
        #expect(vb.height == .init(100))
    }

    @Test
    func `ViewBox description is space-separated values`() {
        let vb = SVG_Standard.Types.ViewBox(width: .init(100), height: .init(200))
        #expect(vb.description == "0 0 100 200")
    }

    @Test
    func `LineCap has three values with correct raw strings`() {
        #expect(SVG_Standard.Painting.LineCap.butt.rawValue == "butt")
        #expect(SVG_Standard.Painting.LineCap.round.rawValue == "round")
        #expect(SVG_Standard.Painting.LineCap.square.rawValue == "square")
    }

    @Test
    func `LineJoin has three values with correct raw strings`() {
        #expect(SVG_Standard.Painting.LineJoin.miter.rawValue == "miter")
        #expect(SVG_Standard.Painting.LineJoin.round.rawValue == "round")
        #expect(SVG_Standard.Painting.LineJoin.bevel.rawValue == "bevel")
    }

    @Test
    func `FillRule has two values with correct raw strings`() {
        #expect(SVG_Standard.Painting.FillRule.nonzero.rawValue == "nonzero")
        #expect(SVG_Standard.Painting.FillRule.evenodd.rawValue == "evenodd")
    }

    @Test
    func `LinearGradient stores id`() {
        let gradient = SVG_Standard.PaintServers.LinearGradient(id: "myGradient")
        #expect(gradient.id == "myGradient")
    }

    @Test
    func `LinearGradient tag name is linearGradient`() {
        #expect(SVG_Standard.PaintServers.LinearGradient.tagName == "linearGradient")
    }

    @Test
    func `LinearGradient stores gradient vector coordinates`() {
        let gradient = SVG_Standard.PaintServers.LinearGradient(
            id: "g1",
            x1: "0%",
            y1: "0%",
            x2: "100%",
            y2: "100%"
        )
        #expect(gradient.x1 == "0%")
        #expect(gradient.y1 == "0%")
        #expect(gradient.x2 == "100%")
        #expect(gradient.y2 == "100%")
    }

    @Test
    func `LinearGradient GradientUnits raw values`() {
        #expect(
            SVG_Standard.PaintServers.LinearGradient.GradientUnits.userSpaceOnUse.rawValue
                == "userSpaceOnUse"
        )
        #expect(
            SVG_Standard.PaintServers.LinearGradient.GradientUnits.objectBoundingBox.rawValue
                == "objectBoundingBox"
        )
    }

    @Test
    func `LinearGradient SpreadMethod raw values`() {
        #expect(SVG_Standard.PaintServers.LinearGradient.SpreadMethod.pad.rawValue == "pad")
        #expect(SVG_Standard.PaintServers.LinearGradient.SpreadMethod.reflect.rawValue == "reflect")
        #expect(SVG_Standard.PaintServers.LinearGradient.SpreadMethod.repeat.rawValue == "repeat")
    }

    @Test
    func `SVG document element stores dimensions`() {
        let svg = SVG_Standard.Document.SVG(width: .px(800), height: .px(600))
        #expect(svg.width == .px(800))
        #expect(svg.height == .px(600))
    }

    @Test
    func `SVG document tag name is svg`() {
        #expect(SVG_Standard.Document.SVG.tagName == "svg")
    }

    @Test
    func `SVG document element stores viewBox`() {
        let vb = SVG_Standard.Types.ViewBox(width: .init(100), height: .init(100))
        let svg = SVG_Standard.Document.SVG(viewBox: vb)
        #expect(svg.viewBox == vb)
    }

    @Test
    func `Text element stores content`() {
        let text = SVG_Standard.Text.Text(content: "Hello SVG")
        #expect(text.content == "Hello SVG")
    }

    @Test
    func `Text element tag name is text`() {
        #expect(SVG_Standard.Text.Text.tagName == "text")
    }

    @Test
    func `Text element stores position`() {
        let text = SVG_Standard.Text.Text(x: .init(10), y: .init(20), content: "Positioned")
        #expect(text.x == .init(10))
        #expect(text.y == .init(20))
        #expect(text.content == "Positioned")
    }

    @Test
    func `Text LengthAdjust raw values`() {
        #expect(SVG_Standard.Text.Text.LengthAdjust.spacing.rawValue == "spacing")
        #expect(SVG_Standard.Text.Text.LengthAdjust.spacingAndGlyphs.rawValue == "spacingAndGlyphs")
    }

    @Test
    func `Transform translate description`() {
        let t = SVG_Standard.Types.Transform.translate(x: .init(10), y: .init(20))
        #expect(t.description == "translate(10 20)")
    }

    @Test
    func `Transform rotate description without center`() {
        let t = SVG_Standard.Types.Transform.rotate(angle: .init(45))
        #expect(t.description == "rotate(45)")
    }

    @Test
    func `Transform rotate description with center`() {
        let t = SVG_Standard.Types.Transform.rotate(angle: .init(90), cx: .init(50), cy: .init(50))
        #expect(t.description == "rotate(90 50 50)")
    }

    @Test
    func `Transform scale description with uniform scale`() {
        let t = SVG_Standard.Types.Transform.scale(x: 2)
        #expect(t.description == "scale(2)")
    }

    @Test
    func `Transform scale description with non-uniform scale`() {
        let t = SVG_Standard.Types.Transform.scale(x: 2, y: 3)
        #expect(t.description == "scale(2 3)")
    }

    @Test
    func `Transform skewX description`() {
        let t = SVG_Standard.Types.Transform.skewX(angle: .init(30))
        #expect(t.description == "skewX(30)")
    }

    @Test
    func `Transform skewY description`() {
        let t = SVG_Standard.Types.Transform.skewY(angle: .init(15))
        #expect(t.description == "skewY(15)")
    }
}

extension SVG_Standard.Test.`Edge Case` {

    @Test
    func `Circle with zero radius`() {
        let circle = SVG_Standard.Shapes.Circle(r: .init(0))
        #expect(circle.r == .init(0))
    }

    @Test
    func `Line with coincident start and end`() {
        let line = SVG_Standard.Shapes.Line(
            x1: .init(50),
            y1: .init(50),
            x2: .init(50),
            y2: .init(50)
        )
        #expect(line.x1 == line.x2)
        #expect(line.y1 == line.y2)
    }

    @Test
    func `SVG document with nil dimensions`() {
        let svg = SVG_Standard.Document.SVG()
        #expect(svg.width == nil)
        #expect(svg.height == nil)
        #expect(svg.viewBox == nil)
    }

    @Test
    func `LinearGradient with all nil optional fields`() {
        let gradient = SVG_Standard.PaintServers.LinearGradient()
        #expect(gradient.id == nil)
        #expect(gradient.x1 == nil)
        #expect(gradient.y1 == nil)
        #expect(gradient.x2 == nil)
        #expect(gradient.y2 == nil)
        #expect(gradient.href == nil)
        #expect(gradient.gradientUnits == nil)
        #expect(gradient.spreadMethod == nil)
    }

    @Test
    func `Text element with nil content`() {
        let text = SVG_Standard.Text.Text()
        #expect(text.content == nil)
        #expect(text.x == nil)
        #expect(text.y == nil)
    }

    @Test
    func `Length Equatable distinguishes cases`() {
        let px = SVG_Standard.Types.Length.px(100)
        let em = SVG_Standard.Types.Length.em(100)
        let pxSame = SVG_Standard.Types.Length.px(100)
        #expect(px != em)
        #expect(px == pxSame)
    }

    @Test
    func `ViewBox with non-zero origin`() {
        let vb = SVG_Standard.Types.ViewBox(
            minX: .init(10),
            minY: .init(20),
            width: .init(100),
            height: .init(200)
        )
        #expect(vb.description == "10 20 100 200")
    }

    @Test
    func `Transform matrix description`() {
        let t = SVG_Standard.Types.Transform.matrix(a: 1, b: 0, c: 0, d: 1, e: 0, f: 0)
        #expect(t.description == "matrix(1 0 0 1 0 0)")
    }
}

extension SVG_Standard.Test.Integration {

    @Test
    func `SVG_Standard typealias provides access to all namespaces`() {

        _ = SVG_Standard.Shapes.Circle(cx: .init(0), cy: .init(0), r: .init(10))
        _ = SVG_Standard.Shapes.Line(x1: .init(0), y1: .init(0), x2: .init(10), y2: .init(10))

        _ = SVG_Standard.Types.Length.px(100)
        _ = SVG_Standard.Types.ViewBox(width: .init(100), height: .init(100))
        _ = SVG_Standard.Types.Transform.translate(x: .init(0), y: .init(0))

        _ = SVG_Standard.Painting.LineCap.butt
        _ = SVG_Standard.Painting.LineJoin.miter
        _ = SVG_Standard.Painting.FillRule.nonzero

        _ = SVG_Standard.PaintServers.LinearGradient(id: "test")

        _ = SVG_Standard.Document.SVG(width: .px(100), height: .px(100))

        _ = SVG_Standard.Text.Text(content: "test")
    }

    @Test
    func `SVG document with viewBox and shapes`() {
        let vb = SVG_Standard.Types.ViewBox(width: .init(200), height: .init(200))
        let svg = SVG_Standard.Document.SVG(viewBox: vb)
        let circle = SVG_Standard.Shapes.Circle(cx: .init(100), cy: .init(100), r: .init(50))

        #expect(svg.viewBox?.width == .init(200))
        #expect(circle.cx == .init(100))
    }
}
