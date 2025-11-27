# swift-svg-standard

[![CI](https://github.com/swift-standards/swift-svg-standard/workflows/CI/badge.svg)](https://github.com/swift-standards/swift-svg-standard/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Swift SVG Standard — Re-export of W3C SVG 2 specification implementation.

## Overview

`swift-svg-standard` is the standard wrapper package that re-exports `swift-w3c-svg`, providing a canonical import point for SVG functionality in Swift.

This package serves as the standard entry point for:
- Type-safe SVG element creation
- W3C SVG 2 specification compliance
- Foundation-free implementation
- Zero external dependencies

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-svg-standard", from: "0.1.0")
]
```

## Usage

```swift
import W3C_SVG

// Create shapes using W3C_SVG2 namespace
let circle = W3C_SVG2.Shapes.Circle(cx: 50, cy: 50, r: 40)
let rect = W3C_SVG2.Shapes.Rectangle(x: 10, y: 10, width: 100, height: 80)

// Use gradient paint servers
let gradient = W3C_SVG2.PaintServers.LinearGradient(
    id: "myGradient",
    x1: "0%",
    y1: "0%",
    x2: "100%",
    y2: "100%"
)
```

## Architecture

This package simply re-exports `swift-w3c-svg`:

```swift
@_exported import W3C_SVG
```

All functionality is provided by the underlying W3C SVG 2 implementation.

## Related Packages

### Core Dependencies
- [swift-w3c-svg](https://github.com/swift-standards/swift-w3c-svg): W3C SVG 2 specification implementation

### Ecosystem
- [swift-svg-printer](https://github.com/coenttb/swift-svg-printer): Rendering layer for SVG to String/bytes
- [swift-svg](https://github.com/coenttb/swift-svg): Type-safe SVG generation

## Migration from swift-svg-standard

If you're migrating from `swift-svg-standard`, update your imports and type references:

```swift
// Old:
import SVG_Standard
let transform = SVGTransform.translate(x: 10, y: 20)

// New:
import W3C_SVG
let transform = W3C_SVG2.Types.Transform.translate(x: 10, y: 20)
```

### Type Mapping

| swift-svg-standard | swift-w3c-svg |
|-----------------|---------------|
| `SVGTransform` | `W3C_SVG2.Types.Transform` |
| `SVGLength` | `W3C_SVG2.Types.Length` |
| `SVGViewBox` | `W3C_SVG2.Types.ViewBox` |
| `SVGColor` | `W3C_SVG2.Types.Color` |
| `SVGLineCap` | `W3C_SVG2.Painting.LineCap` |
| `SVGLineJoin` | `W3C_SVG2.Painting.LineJoin` |
| `SVGFillRule` | `W3C_SVG2.Painting.FillRule` |
| `Text` | `W3C_SVG2.Text.Text` |
| `TSpan` | `W3C_SVG2.Text.TSpan` |

## Platform Support

- macOS 15+
- iOS 18+
- tvOS 18+
- watchOS 11+
- Swift 6.2+

## License

Apache License 2.0

## Standards Reference

- [W3C SVG 2 Specification](https://www.w3.org/TR/SVG2/)
- Direct mapping from specification chapters to Swift namespaces
- Each type includes W3C section reference in documentation
