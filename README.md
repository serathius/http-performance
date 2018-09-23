Benchmarking HTTP servers overhead

Requirements:
* Return 200 response with content `Hello, World!`

Run server 
```bash
make sanic_python3
```

Benchmark 100r/s
```bash
make benchmark_1
```

Benchmark 1000r/s
```bash
make benchmark_2
```

Benchmark 10000r/s
```bash
make benchmark_3
```

