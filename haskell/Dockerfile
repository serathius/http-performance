FROM haskell:8.4.3
RUN stack setup && stack update

COPY happystack/http.cabal happystack/http.cabal
COPY happystack/stack.yaml happystack/stack.yaml
RUN cd happystack && stack build || true

COPY scotty/http.cabal scotty/http.cabal
COPY scotty/stack.yaml scotty/stack.yaml
RUN cd scotty && stack build || true

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
RUN cd happystack && stack install

COPY scotty scotty
RUN cd scotty && stack install

COPY snap snap
RUN cd snap && stack install

COPY spock spock
RUN cd spock && stack install

COPY warp warp
RUN cd warp && stack install

COPY yesod yesod
RUN cd yesod && stack install

FROM scratch
COPY --from=0 /root/.local/bin /
