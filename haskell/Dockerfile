FROM haskell:8.4.3 as base
RUN stack setup && stack update

FROM haskell:8.4.3 as happystack
COPY --from=base /root/.stack /root/.stack
COPY happystack/http.cabal happystack/http.cabal
COPY happystack/stack.yaml happystack/stack.yaml
RUN cd happystack && stack build || true
COPY happystack happystack
RUN cd happystack && stack install

FROM haskell:8.4.3 as scotty
COPY --from=base /root/.stack /root/.stack
COPY scotty/http.cabal scotty/http.cabal
COPY scotty/stack.yaml scotty/stack.yaml
RUN cd scotty && stack build || true
COPY scotty scotty
RUN cd scotty && stack install

FROM haskell:8.4.3 as snap
COPY --from=base /root/.stack /root/.stack
COPY snap/http.cabal snap/http.cabal
COPY snap/stack.yaml snap/stack.yaml
RUN cd snap && stack build || true
COPY snap snap
RUN cd snap && stack install

FROM haskell:8.4.3 as spock
COPY --from=base /root/.stack /root/.stack
COPY spock/http.cabal spock/http.cabal
COPY spock/stack.yaml spock/stack.yaml
RUN cd spock && stack build || true
COPY spock spock
RUN cd spock && stack install

FROM haskell:8.4.3 as warp
COPY --from=base /root/.stack /root/.stack
COPY warp/http.cabal warp/http.cabal
COPY warp/stack.yaml warp/stack.yaml
RUN cd warp && stack build || true
COPY warp warp
RUN cd warp && stack install

FROM haskell:8.4.3 as yesod
COPY --from=base /root/.stack /root/.stack
COPY yesod/http.cabal yesod/http.cabal
COPY yesod/stack.yaml yesod/stack.yaml
RUN cd yesod && stack build || true
COPY yesod yesod
RUN cd yesod && stack install

FROM scratch
COPY --from=happystack /root/.local/bin/http_happystack /
COPY --from=scotty /root/.local/bin/http_scotty /
COPY --from=snap /root/.local/bin/http_snap /
COPY --from=spock /root/.local/bin/http_spock /
COPY --from=warp /root/.local/bin/http_warp /
COPY --from=yesod /root/.local/bin/http_yesod /
