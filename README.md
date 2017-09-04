Goal of this benchmarks is to prove that faster programming language do not imply lower overhead on http server.

Minimize metric: P95 latency

Requirements 
* 3 concurrent connections
* min 200 requests per second
* P95 latency < 1ms
* Per core


Run server 
```bash
make sanic_python3
```

Test performance
```bash
make profile
```

