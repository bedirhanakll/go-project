package main

import (
	admin_models "goblog/admin/models"
	"goblog/config"
	"net/http"
)

func main() {
	admin_models.Post{}.Migrate()
	admin_models.User{}.Migrate()
	admin_models.Ilan{}.Migrate()
	admin_models.Category{}.Migrate()
	admin_models.UrunCategory{}.Migrate()
	admin_models.Kurum{}.Migrate()

	admin_models.Urun{}.Migrate()
	http.ListenAndServe(":8080", config.Routes())
}
