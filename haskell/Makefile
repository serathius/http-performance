haskell_image:
	cd haskell && stack build
	docker build -t http_haskell haskell

haskell_warp: haskell_image
	$(RUN) http_haskell ./hello
