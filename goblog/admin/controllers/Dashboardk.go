package controllers

import (
	"fmt"
	"github.com/gosimple/slug"
	"github.com/julienschmidt/httprouter"
	"goblog/admin/helpers"
	"goblog/admin/models"
	"html/template"
	"io"
	"net/http"
	"os"
)

type Dashboardk struct{}

func (dashboardk Dashboardk) Index(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.New("index").Funcs(template.FuncMap{
		"getCategory": func(categoryID int) string {
			return models.Category{}.Get(categoryID).Title
		},
	}).ParseFiles(helpers.Include("dashboard/kurumsalekle/list")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Kurums"] = models.Kurum{}.GetAll()
	data["Alert"] = helpers.GetAlert(w, r)
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardk Dashboardk) NewItem(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.ParseFiles(helpers.Include("dashboard/kurumsalekle/add")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardk Dashboardk) Add(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	title := r.FormValue("blog-title")
	slug := slug.Make(title)
	description := r.FormValue("blog-desc")

	//Upload
	r.ParseMultipartForm(10 << 20)
	file, header, err := r.FormFile("blog-picture")
	if err != nil {
		fmt.Println(err)
		return
	}
	f, err := os.OpenFile("uploads/"+header.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		return
	}
	_, err = io.Copy(f, file)
	// Upload End
	if err != nil {
		fmt.Println(err)
		return
	}
	models.Kurum{
		Title:       title,
		Slug:        slug,
		Description: description,
		Picture_url: "uploads/" + header.Filename,
	}.Add()
	helpers.SetAlert(w, r, "Kayıt Başarıyla Eklendi")
	http.Redirect(w, r, "/admin/kurumsal", http.StatusSeeOther)
}

func (dashboardk Dashboardk) Delete(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	post := models.Kurum{}.Get(params.ByName("id"))
	post.Delete()
	http.Redirect(w, r, "/admin/kurumsal", http.StatusSeeOther)
}

func (dashboardk Dashboardk) Edit(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.ParseFiles(helpers.Include("dashboard/kurumsalekle/edit")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Kurum"] = models.Kurum{}.Get(params.ByName("id"))
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardk Dashboardk) Update(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	post := models.Kurum{}.Get(params.ByName("id"))
	title := r.FormValue("blog-title")
	slug := slug.Make(title)
	description := r.FormValue("blog-desc")
	is_selected := r.FormValue("is_selected")
	var picture_url string

	if is_selected == "1" {
		//Upload
		r.ParseMultipartForm(10 << 20)
		file, header, err := r.FormFile("blog-picture")
		if err != nil {
			fmt.Println(err)
			return
		}
		f, err := os.OpenFile("uploads/"+header.Filename, os.O_WRONLY|os.O_CREATE, 0666)
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err = io.Copy(f, file)
		// Upload End
		picture_url = "uploads/" + header.Filename
		os.Remove(post.Picture_url)
	} else {
		picture_url = post.Picture_url
	}

	post.Updates(models.Kurum{
		Title:       title,
		Slug:        slug,
		Description: description,
		Picture_url: picture_url,
	})
	http.Redirect(w, r, "/admin/kurumsaledit/"+params.ByName("id"), http.StatusSeeOther)
}
