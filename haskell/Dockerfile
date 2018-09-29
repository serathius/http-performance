FROM haskell:8.4.3
RUN stack setup && stack update

COPY happystack/http.cabal happystack/http.cabal
COPY happystack/stack.yaml happystack/stack.yaml
RUN cd happystack && stack build || true

COPY snap/http.cabal snap/http.cabal
COPY snap/stack.yaml snap/stack.yaml
RUN cd snap && stack build || true

COPY spock/http.cabal spock/http.cabal
COPY spock/stack.yaml spock/stack.yaml
RUN cd spock && stack build || true

COPY warp/http.cabal warp/http.cabal
COPY warp/stack.yaml warp/stack.yaml
RUN cd warp && stack build || true

COPY yesod/http.cabal yesod/http.cabal
COPY yesod/stack.yaml yesod/stack.yaml
RUN cd yesod && stack build || true

COPY happystack happystack
RUN cd happystack && stack build

COPY scotty scotty
RUN cd scotty && stack build

COPY snap snap
RUN cd snap && stack build

COPY spock spock
RUN cd spock && stack build

COPY warp warp
RUN cd warp && stack build

COPY yesod yesod
RUN cd yesod && stack build

FROM scratch
COPY --from=0 happystack/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_happystack
COPY --from=0 warp/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_warp
COPY --from=0 yesod/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_yesod
COPY --from=0 scotty/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_scotty
COPY --from=0 snap/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_snap
COPY --from=0 spock/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_spock
