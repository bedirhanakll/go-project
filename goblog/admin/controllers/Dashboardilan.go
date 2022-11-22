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

type Dashboardilan struct{}

func (dashboardilan Dashboardilan) Index(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.New("index").Funcs(template.FuncMap{
		"getCategory": func(categoryID int) string {
			return models.Category{}.Get(categoryID).Title
		},
	}).ParseFiles(helpers.Include("dashboard/ilanekle/list")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Ilans"] = models.Ilan{}.GetAll()
	data["Alert"] = helpers.GetAlert(w, r)
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardilan Dashboardilan) NewItem(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.ParseFiles(helpers.Include("dashboard/ilanekle/add")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Categories"] = models.Category{}.GetAll()
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardilan Dashboardilan) Add(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	title := r.FormValue("blog-title")
	slug := slug.Make(title)
	description := r.FormValue("blog-desc")
	content := r.FormValue("blog-content")

	models.Ilan{
		Title:       title,
		Slug:        slug,
		Description: description,
		Content:     content,
	}.Add()
	helpers.SetAlert(w, r, "Kayıt Başarıyla Eklendi")
	http.Redirect(w, r, "/admin/ilan", http.StatusSeeOther)
}

func (dashboardilan Dashboardilan) Delete(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	post := models.Ilan{}.Get(params.ByName("id"))
	post.Delete()
	http.Redirect(w, r, "/admin/ilan", http.StatusSeeOther)
}

func (dashboardilan Dashboardilan) Edit(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.ParseFiles(helpers.Include("dashboard/ilanekle/edit")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Ilan"] = models.Ilan{}.Get(params.ByName("id"))
	data["Categories"] = models.Category{}.GetAll()
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardilan Dashboardilan) Update(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	post := models.Ilan{}.Get(params.ByName("id"))
	title := r.FormValue("blog-title")
	slug := slug.Make(title)
	description := r.FormValue("blog-desc")
	content := r.FormValue("blog-content")


	post.Updates(models.Ilan{
		Title:       title,
		Slug:        slug,
		Description: description,
		Content:     content,
	})
	http.Redirect(w, r, "/admin/ilanedit/"+params.ByName("id"), http.StatusSeeOther)
}
