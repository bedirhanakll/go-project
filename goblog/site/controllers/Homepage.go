package controllers

import (
	"fmt"
	"github.com/julienschmidt/httprouter"
	"goblog/site/helpers"
	"goblog/site/models"
	"html/template"
	"net/http"
	"time"
)

type Homepage struct{}

func (homepage Homepage) Index(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.New("index").Funcs(template.FuncMap{
		"getCategory": func(categoryID int) string {
			return models.Category{}.Get(categoryID).Title
		},
		"getDate": func(t time.Time) string {
			return fmt.Sprintf("%02d.%02d.%d", t.Day(), int(t.Month()), t.Year())
		},
	}).ParseFiles(helpers.Include("homepage/home")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Posts"] = models.Post{}.GetAll()
	view.ExecuteTemplate(w, "index", data)
}

func (homepage Homepage) Detail(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.ParseFiles(helpers.Include("homepage/blogdetail")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Post"] = models.Post{}.Get("title = ?", params.ByName("title"))
	view.ExecuteTemplate(w, "index", data)
}

func (homepage Homepage) Blog(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.ParseFiles(helpers.Include("homepage/blog")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Posts"] = models.Post{}.GetAll()
	view.ExecuteTemplate(w, "blog", data)
}
func (homepage Homepage) Shop(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.ParseFiles(helpers.Include("homepage/shop")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Urun"] = models.Urun{}.GetAll()
	view.ExecuteTemplate(w, "index", data)
}
func (homepage Homepage) UrunDetail(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.ParseFiles(helpers.Include("homepage/shopdetail")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Uruns"] = models.Urun{}.Get("title = ?", params.ByName("title"))
	view.ExecuteTemplate(w, "index", data)
}
func (homepage Homepage) Ilan(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.ParseFiles(helpers.Include("homepage/ilan")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Ilan"] = models.Ilan{}.GetAll()
	view.ExecuteTemplate(w, "blog", data)
}
func (homepage Homepage) IlanDetail(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.ParseFiles(helpers.Include("homepage/ilandetail")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Ilans"] = models.Ilan{}.Get("title = ?", params.ByName("title"))
	view.ExecuteTemplate(w, "index", data)
}
func (homepage Homepage) Kurumsal(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	view, err := template.ParseFiles(helpers.Include("homepage/kurumsal")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Kurums"] = models.Kurum{}.GetAll()
	view.ExecuteTemplate(w, "blog", data)
}