MathJax.Hub.Config({
  jax: ["input/AsciiMath", "output/HTML-CSS"],
  extensions: ["asciimath2jax.js"],
  asciimath2jax: {
    delimiters: [['<AsciiMath>', '</AsciiMath>']],
    preview: "[math]"
  },
  AsciiMath: {
    decimal: "."
  },
  "HTML-CSS": {
    undefinedFamily: "STIXGeneral,'DejaVu Sans Mono','Arial Unicode MS',serif"
  }
});