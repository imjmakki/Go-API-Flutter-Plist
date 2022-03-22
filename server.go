package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"log"
	"net/http"
)

const port = ":5500"

func main() {

	router := mux.NewRouter()
	router.HandleFunc("/", rootPage)

	fmt.Println("Serving @ http://127.0.0.1" + port)
	log.Fatal(http.ListenAndServe(port, router))
}

func rootPage(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("This is the root page"))
}
