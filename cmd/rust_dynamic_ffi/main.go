package main

// NOTE: There should be NO space between the comments and the `import "C"` line.

/*
#cgo LDFLAGS: -L../../rust -lhello
#include "../../rust/hello.h"
*/
import "C"

func main() {
	C.hello(C.CString("world"))
	C.whisper(C.CString("this is code from the dynamic library"))
}
