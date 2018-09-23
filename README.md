# Benchmarking HTTP servers overhead

Compared to other benchmarks this focuses less on big numbers like maximal requests/second and more about
stability of latency. For microservice architecture it's more important what's your tail latency that can 
slow down your whole system because of multiple slow responses. Building for pretictible number of requests 
and dropping excess traffic can also improve stability of whole system, because having one faster microservice 
doesn't mean that rest of system can handle traffic and could lead to taking system down.

## Approach:
* Return 200 response with content `Hello, World!`
* Focusing on P99 under stable requests per second
* Restricting http server to 1 core
* Required to response to 99% of requests
* Access logs disabled

## TODO
* More advanced scenarios
* More reproducable tests
* Test multicore scalability

## Results
### Top 3 for 100 r/s
* python3 falcon meinheld
* haskell warp
* java

### Top 3 for 1k r/s
* python3 falcon meinheld
* golang fasthttp
* haskell warp

### Top 3 for 10k r/s
* rust hyper
* python3 vibora
* golang fasthttp

### Full Table of P99 latency in ms
| Language | Framework | Server    | 100 r/s    | 1000 r/s  | 10000 r/s |
|----------|-----------|-----------|-----------:|----------:|----------:|
| python3  | falcon    | meinheld  | 1.99       | 2.04      | 881.15    |     
| golang   |           | fasthttp  | 2.23       | 2.07      | 20.35     |
| haskell  |           | warp      | 2.12       | 2.08      | 23.31     |
| python3  | vibora    | warp      | 2.21       | 2.22      | 19.87     |
| golang   |           | nett/http | 2.33       | 2.35      |           |
| java     |           |           | 2.17       | 2.39      |           |
| node     |           |           | 2.17       | 2.55      | 35.74     |
| python3  | falcon    | bjoern    | 2.33       | 2.93      | 28.29     |
| python3  | sanic     |           | 2.52       | 3.07      | 20.61     |
| rust     | hyper     |           | 2.31       | 3.30      | 19.33     |
| python3  | flask     | bjoern    | 3.11       | 5.11      |           |
| python3  | aiohttp   |           | 2.88       | 5.85      |           |
| pypy2    | falcon    | meinheld  | 2.17       | 7.13      |           |
| python3  | tornado   |           | 4.09       | 8.60      |           |
| python3  | flask     | gevent    | 4.19       | 10.61     |           |
| python3  | flask     | eventlet  | 4.41       | 12.33     |           |
| python3  | flask     | gthread   | 4.85       | 9.52      |           |
| python3  | flask     | netius    | 4.19       | 12.69     |           |
| pypy2    | flask     | sync      | 98.11      | 112.96    |           |
| pypy3    | flask     | sync      | 95.81      | 121.66    |           |
| python3  | flask     | sync      | 100.48     | 127.49    |           |
| python2  | flask     | sync      | 100.93     | 129.47    |           |

## Running

### Start server 
```bash
make sanic_python3
```

### Benchmark 100r/s
```bash
make benchmark_1
```

### Benchmark 1000r/s
```bash
make benchmark_2
```

### Benchmark 10000r/s
```bash
make benchmark_3
```
