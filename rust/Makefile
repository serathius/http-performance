rust_hyper: rust_image
	$(RUN) http_rust /http_hyper

rust_nickel: rust_image
	$(RUN) http_rust /http_nickel

rust_rocket: rust_image
	$(RUN) http_rust /http_rocket

rust_rust: rust_image
	$(RUN) http_rust /http_iron

rust_image:
	docker build -t http_rust rust
