package main

import (
	"fmt"
	"os"

	"github.com/ppanyukov/mesos-discovery-go/hellolib"
)

// Simple thing which prints greeting to the current user.
// Uses $USER env var.
func main() {
	user := os.Getenv("USER")
	if user == "" {
		user = "unknown"
	}

	greeting := hellolib.SayHello(user)
	fmt.Println(greeting)
}
