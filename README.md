# GO-FFI

Go FFI to call C and Rust code.

## Cross compile Rust binary to Linux amd64 from Mac M1

Install linux amd64 toolchain target:

``` bash
rustup target add x86_64-unknown-linux-gnu
# install pre build cross compiling tool
brew install SergioBenitez/osxct/x86_64-unknown-linux-gnu
```

To cross compile we need to set some environment variable CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER:

``` bash
    CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc cargo build --target=x86_64-unknown-linux-gnu
```
