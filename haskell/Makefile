haskell_image:
	docker build -t http_haskell haskell

haskell_warp: haskell_image
	$(RUN) http_haskell /http_warp

haskell_yesod: haskell_image
	$(RUN) http_haskell /http_yesod > /dev/null

haskell_happystack: haskell_image
	$(RUN) http_haskell /http_happystack

haskell_scotty: haskell_image
	$(RUN) http_haskell /http_scotty

haskell_snap: haskell_image
	$(RUN) http_haskell /http_snap 2> /dev/null

haskell_spock: haskell_image
	$(RUN) http_haskell /http_spock
