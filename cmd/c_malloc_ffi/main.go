package main

//#include "../../c/malloc.c"
import "C"

func main() {

	for {
		C.mallocLeak()
	}
}
