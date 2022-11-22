package controllers

import (
	"fmt"
	"github.com/gosimple/slug"
	"github.com/julienschmidt/httprouter"
	"goblog/admin/helpers"
	"goblog/admin/models"
	"html/template"
	"net/http"
)

type UrunCategories struct{}

func (uruncategories UrunCategories) Index(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.ParseFiles(helpers.Include("uruncategories/list")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["UrunCategories"] = models.UrunCategory{}.GetAll()
	data["Alert"] = helpers.GetAlert(w, r)
	view.ExecuteTemplate(w, "index", data)
}

func (uruncategories UrunCategories) Add(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	categoryTitle := r.FormValue("category-title")
	categorySlug := slug.Make(categoryTitle)

	models.UrunCategory{Title: categoryTitle, Slug: categorySlug}.Add()

	helpers.SetAlert(w, r, "Kayıt Başarıyla Eklendi")
	http.Redirect(w, r, "/admin/urunkategoriler", http.StatusSeeOther)
}

func (uruncategories UrunCategories) Delete(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	category := models.UrunCategory{}.Get(params.ByName("id"))
	category.Delete()
	helpers.SetAlert(w, r, "Kayıt Başarıyla Silindi...")
	http.Redirect(w, r, "/admin/urunkategoriler", http.StatusSeeOther)
}
