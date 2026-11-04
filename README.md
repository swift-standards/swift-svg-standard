# swift-svg-standard

Use this package when you want the SVG 2 element and value types under the Institute's standard import, without depending on a specific specification package. Start from `SVG_Standard`, which is `W3C_SVG2` from swift-w3c-svg. Importing it also imports `W3C_SVG`. If you want to depend on the W3C implementation directly, use swift-w3c-svg.

## Laws

- A length's description is its number followed by its unit, such as `100px` or `2.5em`. A percentage ends in `%`, and a unitless number has no suffix. Whole numbers print without a decimal point.
- An integer or float literal used as a `SVG_Standard.Types.Length` is a unitless number.
- A `SVG_Standard.Types.ViewBox` describes itself as min x, min y, width and height, separated by spaces. Min x and min y default to zero.
- A `SVG_Standard.Types.Transform` describes itself in SVG transform syntax with arguments separated by spaces. A rotation includes its centre only when one is given, and a scale writes one value when only `x` is given.
