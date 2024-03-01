# PHONY means that it doesn't correspond to a file; it always runs the build commands.
# @ command is not shown 

.PHONY: build-all
build-all: build-c build-dynamic build-static build-server

.PHONY: build-c
build-c:
	go build -o bin/c cmd/c_ffi/main.go

.PHONY: build-dynamic
build-dynamic:
	@cd rust/hello && cargo build --release
	@cp rust/hello/target/release/libhello.dylib rust/
	go build -o bin/rust_dynamic cmd/rust_dynamic_ffi/main.go

.PHONY: build-static
build-static:
	@cd rust/hello && cargo build --release
	@cp rust/hello/target/release/libhello.a rust/
	go build -o bin/rust_static cmd/rust_static_ffi/main.go

.PHONY: build-server
build-server:
	@cd rust/hello && cargo build --release
	@cp rust/hello/target/release/libhello.a cmd/rust_ffi_server/ 
	@cp rust/hello.h cmd/rust_ffi_server/ 
	go build -o bin/rust_server cmd/rust_ffi_server/main.go
	rm -rf cmd/rust_ffi_server/libhello.a cmd/rust_ffi_server/hello.h

.PHONY: build-server-release # to be compatible with linux amd64
build-server-release:
	@cd rust/hello && CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc cargo build --release --target=x86_64-unknown-linux-gnu
	@cp rust/hello/target/x86_64-unknown-linux-gnu/release/libhello.a cmd/rust_ffi_server/ 
	@cp rust/hello.h cmd/rust_ffi_server/ 
	go build -o bin/rust_server-release cmd/rust_ffi_server/main.go
	rm -rf cmd/rust_ffi_server/libhello.a cmd/rust_ffi_server/hello.h
