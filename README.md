# Benchmarking HTTP servers overhead

Compared to other benchmarks this focuses less on big numbers like maximal requests/second and more about
stability of latency. For microservice architecture it's more important what's your tail latency that can 
slow down your whole system because of multiple slow responses. Building for pretictible number of requests 
and dropping excess traffic can also improve stability of whole system, because having one faster microservice 
doesn't mean that rest of system can handle traffic and could lead to taking system down.

## Scenarios
* Respond with content `Hello, World!`
* Burn for 75% CPU in around 20 steps (e.g. with 100 requests per second in every request burn 100% CPU for 7.5 ms)
* Sleep for 75% CPU in around 20 steps
* Respond with 1MB content

## Approach:
* Focusing on P99 under stable requests per second
* Restricting http server to 1 core
* Required to response to 99% of requests
* Access logs disabled

## TODO
* More reproducable tests
* Test multicore scalability

### Hello World response P99 latency in ms
| Language | Framework | Server    | Status        | 100 r/s    | 1000 r/s  | 10000 r/s |
|----------|-----------|-----------|--------------:|-----------:|----------:|----------:|
| python3  | falcon    | meinheld  |               | 1.99       | 2.04      | 881.15    |     
| golang   |           | fast/http |               | 2.23       | 2.07      | 20.35     |
| haskell  |           | warp      |               | 2.12       | 2.08      | 23.31     |
| python3  | japronto  |           | early preview | 2.09       | 2.14      | 12.38     |
| rust     | hyper     |           |               | 2.05       | 2.18      | 16.35     |
| python3  | vibora    |           | alpha         | 2.21       | 2.22      | 19.87     |
| golang   |           | nett/http |               | 2.33       | 2.35      |           |
| java     |           |           |               | 2.17       | 2.39      |           |
| node     |           |           |               | 2.17       | 2.55      | 35.74     |
| python3  | falcon    | bjoern    |               | 2.33       | 2.93      | 28.29     |
| python3  | sanic     |           |               | 2.52       | 3.07      | 20.61     |
| python3  | flask     | bjoern    |               | 3.11       | 5.11      |           |
| python3  | aiohttp   |           |               | 2.88       | 5.85      |           |
| python3  | django    | meinheld  |               | 2.79       | 6.19      |           |
| pypy2    | falcon    | meinheld  |               | 2.17       | 7.13      |           |
| python3  | tornado   |           |               | 4.09       | 8.60      |           |
| python3  | flask     | gevent    |               | 4.19       | 10.61     |           |
| python3  | flask     | eventlet  |               | 4.41       | 12.33     |           |
| python3  | flask     | gthread   |               | 4.85       | 9.52      |           |
| python3  | flask     | netius    |               | 4.19       | 12.69     |           |
| pypy2    | flask     | sync      |               | 98.11      | 112.96    |           |
| pypy3    | flask     | sync      |               | 95.81      | 121.66    |           |
| python3  | flask     | sync      |               | 100.48     | 127.49    |           |
| python2  | flask     | sync      |               | 100.93     | 129.47    |           |

### Burn 75% CPU response P99 latency in ms
| Language | Framework | Server    | Status        | 100 r/s    |
|----------|-----------|-----------|--------------:|-----------:|
| rust     | hyper     |           |               | 31.81      |
| pypy2    | falcon    | meinheld  |               | 33.34      | 
| python3  | falcon    | meinheld  |               | 34.94      |
| python3  | flask     | meinheld  |               | 36.22      |
| python3  | django    | meinheld  |               | 37.79      |
| golang   |           | fast/http |               | 38.14      |
| python3  | aiohttp   |           |               | 39.26      |
| python3  | falcon    | gthread   |               | 39.84      |
| python3  | falcon    | tornado   |               | 40.83      |
| python3  | tornado   |           |               | 42.53      |
| golang   |           | net/http  |               | 43.52      |
| python3  | japronto  |           | early preview | 45.09      |
| python3  | vibora    |           | alpha         | 45.63      |
| python3  | sanic     |           |               | 46.78      |
| haskell  |           | warp      |               | 47.81      |
| python3  | falcon    | eventlet  |               | 48.19      |
| python3  | falcon    | netius    |               | 49.22      |
| python3  | falcon    | gevent    |               | 49.28      |
| python3  | falcon    | waitress  |               | 50.08      |
| python3  | flask     | gevent    |               | 50.97      |
| python3  | falcon    | bjoern    |               | 60.06      |
| python3  | falcon    | sync      |               | 139.26     |

### Sleep response P99 latency in ms
| Language | Framework | Server    | Status        | 100 r/s    |
|----------|-----------|-----------|--------------:|-----------:|
| python3  | vibora    |           | alpha         | 9.45       |
| python3  | japronto  |           | early preview | 9.58       |
| python3  | sanic     |           |               | 9.87       |
| golang   |           | fast/http |               | 9.88       |
| golang   |           | net/http  |               | 9.95       |
| haskell  |           | warp      |               | 10.55      |
| python3  | aiohttp   |           |               | 12.18      |
| python3  | falcon    | waitress  |               | 12.4       |
| python3  | falcon    | gevent    |               | 12.71      |
| python3  | tornado   |           |               | 14.15      |
| python3  | flask     | gevent    |               | 14.92      |
| rust     | hyper     |           |               | 36.32      |
| pypy2    | falcon    | meinheld  |               | 38.69      | 
| python3  | falcon    | meinheld  |               | 38.91      |
| python3  | flask     | meinheld  |               | 42.59      |
| python3  | django    | meinheld  |               | 44.67      |
| python3  | falcon    | gthread   |               | 52.06      |
| python3  | falcon    | tornado   |               | 61.12      |
| python3  | falcon    | bjoern    |               | 63.55      |
| python3  | falcon    | eventlet  |               | 63.97      |
| python3  | falcon    | netius    |               | 65.66      |
| python3  | falcon    | sync      |               | 151.42     |

### Return 1MB response P99 latency in ms
| Language | Framework | Server    | Status        | 100 r/s    |
|----------|-----------|-----------|--------------:|-----------:|
| python3  | vibora    |           | alpha         | 3.32       |
| python3  | japronto  |           | early preview | 3.54       |
| python3  | falcon    | bjoern    |               | 3.61       |
| python3  | falcon    | meinheld  |               | 3.65       |
| python3  | django    | meinheld  |               | 3.88       |
| python3  | sanic     |           |               | 3.88       |
| python3  | flask     | meinheld  |               | 4.05       |
| python3  | falcon    | eventlet  |               | 4.74       |
| golang   |           | net/http  |               | 4.84       |
| python3  | falcon    | netius    |               | 5.42       |
| python3  | flask     | gevent    |               | 5.59       |
| python3  | falcon    | tornado   |               | 6.47       |
| python3  | falcon    | gevent    |               | 6.51       |
| python3  | aiohttp   |           |               | 6.56       |
| python3  | falcon    | gthread   |               | 7.34       |
| golang   |           | fast/http |               | 11.28      |
| python3  | tornado   |           |               | 18.61      |
| pypy2    | falcon    | meinheld  |               | 22.78      | 
| python3  | falcon    | waitress  |               | 29.39      |
| python3  | falcon    | sync      |               | 112.64     |


###[Doc with all results](https://docs.google.com/spreadsheets/d/18TQOIZhg8CLunikgJyi3EGFDjYGLvQ5_RGj-DI2afT4/edit?usp=sharing)

## Running

### Start server 
```bash
make python3_sanic
```

### Benchmark 100r/s hello world scenario
```bash
make benchmark_1_hello
```
