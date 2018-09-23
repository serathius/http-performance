node_image:
	docker build -t http_node node

node: node_image
	$(RUN) http_node node http.js
