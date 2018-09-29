FROM haskell:8.4.3
RUN stack setup && stack update
COPY happystack happystack
COPY scotty scotty
COPY snap snap
COPY spock spock
COPY warp warp
COPY yesod yesod
RUN cd warp && stack build
RUN cd yesod && stack build
RUN cd happystack && stack build
RUN cd scotty && stack build
RUN cd snap && stack build
RUN cd spock && stack build

FROM scratch
COPY --from=0 warp/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_warp
COPY --from=0 yesod/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_yesod
COPY --from=0 happystack/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_happystack
COPY --from=0 scotty/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_scotty
COPY --from=0 snap/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_snap
COPY --from=0 spock/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin/http /http_spock
