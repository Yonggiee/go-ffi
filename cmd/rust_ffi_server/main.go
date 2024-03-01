package main

/*
#cgo LDFLAGS: ${SRCDIR}/libhello.a -ldl
#include "hello.h"
*/
import "C"
import (
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	C.hello(C.CString("world"))
	w.Write([]byte("healthy"))
}
func main() {
	http.HandleFunc("/", handler) // Set endpoint handler
	http.ListenAndServe(":8080", nil)
}
