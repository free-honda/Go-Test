package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()

	// "Hello, World!" を返すハンドラー
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello")
	})

	// サーバーを起動 (外部アクセス用に 0.0.0.0 にバインド)
	e.Logger.Fatal(e.Start("0.0.0.0:1323"))
}
