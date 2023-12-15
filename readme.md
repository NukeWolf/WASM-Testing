# Code Structure

- `compiler.js` compiles the webassembly
- `main.wat` contains the human readable assembly code
- `run.js` interprets and loads the `main.wasm` binary

```
100000th Prime = 1299721

WASM Time: 46.772s
JS Time: 1:16.775 (m:ss.mmm)

10000th Prime = 104729

WASM Time: 329.975ms
JS Time: 568.073ms
```
