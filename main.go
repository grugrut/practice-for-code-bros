package main

import (
	"fmt"
	"log"
	"net/http"
)

func sayVersion(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello! This application is version 2.0!")
}

func main() {
	http.HandleFunc("/", sayVersion)
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
