package main

import (
	"log"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/", func(ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"status": "Ok",
			"data": gin.H{
				"response": "pong",
			},
		})
	})

	log.Fatalln(r.Run())
}
