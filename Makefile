br:
	cargo build --target wasm32-wasi --release;
	wasmedge target/wasm32-wasi/release/sales_tax_rate_lookup.wasm;

bro:
	cargo build --target wasm32-wasi --release;
	wasmedge compile target/wasm32-wasi/release/sales_tax_rate_lookup.wasm sales_tax_rate_lookup.wasm;
	wasmedge sales_tax_rate_lookup.wasm;

brd:
	docker build -t rx9/rust-manning-lp-wasm-microservices-app .
	docker run -p 8001:8001 -d -it --rm rx9/rust-manning-lp-wasm-microservices-app