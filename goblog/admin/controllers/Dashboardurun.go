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
	"strconv"
)

type Dashboardurun struct{}

func (dashboardurun Dashboardurun) IndexUrun(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.New("index").Funcs(template.FuncMap{
		"getCategory": func(uruncategoryID int) string {
			return models.UrunCategory{}.Get(uruncategoryID).Title
		},
	}).ParseFiles(helpers.Include("dashboard/urunekle/urun")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Uruns"] = models.Urun{}.GetAll()
	data["Alert"] = helpers.GetAlert(w, r)
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardurun Dashboardurun) NewItemUrun(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.ParseFiles(helpers.Include("dashboard/urunekle/urunadd")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["UrunCategories"] = models.UrunCategory{}.GetAll()
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardurun Dashboardurun) AddUrun(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	title := r.FormValue("urun-title")
	fiyat := r.FormValue("urun-fiyat")
	slug := slug.Make(title)
	description := r.FormValue("urun-desc")
	categoryID, _ := strconv.Atoi(r.FormValue("urun-category"))
	content := r.FormValue("urun-content")
	//Upload
	r.ParseMultipartForm(10 << 20)
	file, header, err := r.FormFile("urun-picture")
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
	r.ParseMultipartForm(10 << 20)
	file1, header1, err := r.FormFile("urun-picture1")
	if err != nil {
		fmt.Println(err)
		return
	}
	f1, err := os.OpenFile("uploads/"+header1.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		return
	}
	_, err = io.Copy(f1, file1)
	// Upload End
	if err != nil {
		fmt.Println(err)
		return
	}
	r.ParseMultipartForm(10 << 20)
	file2, header2, err := r.FormFile("urun-picture2")
	if err != nil {
		fmt.Println(err)
		return
	}
	f2, err := os.OpenFile("uploads/"+header2.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		return
	}
	_, err = io.Copy(f2, file2)
	// Upload End
	if err != nil {
		fmt.Println(err)
		return
	}
	r.ParseMultipartForm(10 << 20)
	file3, header3, err := r.FormFile("urun-picture3")
	if err != nil {
		fmt.Println(err)
		return
	}
	f3, err := os.OpenFile("uploads/"+header3.Filename, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		return
	}
	_, err = io.Copy(f3, file3)
	// Upload End
	if err != nil {
		fmt.Println(err)
		return
	}

	models.Urun{
		Title:        title,
		Fiyat:        fiyat,
		Slug:         slug,
		Description:  description,
		CategoryID:   categoryID,
		Content:      content,
		Picture_url:  "uploads/" + header.Filename,
		Picture_url1: "uploads/" + header1.Filename,
		Picture_url2: "uploads/" + header2.Filename,
		Picture_url3: "uploads/" + header3.Filename,
	}.Add()
	helpers.SetAlert(w, r, "Kayıt Başarıyla Eklendi")
	http.Redirect(w, r, "/admin/urunler", http.StatusSeeOther)
}

func (dashboardurun Dashboardurun) DeleteUrun(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	post := models.Urun{}.Get(params.ByName("id"))
	post.Delete()
	http.Redirect(w, r, "/admin/urunler", http.StatusSeeOther)
}

func (dashboardurun Dashboardurun) EditUrun(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	view, err := template.ParseFiles(helpers.Include("dashboard/urunekle/urunedit")...)
	if err != nil {
		fmt.Println(err)
		return
	}
	data := make(map[string]interface{})
	data["Urun"] = models.Urun{}.Get(params.ByName("id"))
	data["UrunCategories"] = models.UrunCategory{}.GetAll()
	view.ExecuteTemplate(w, "index", data)
}

func (dashboardurun Dashboardurun) UpdateUrun(w http.ResponseWriter, r *http.Request, params httprouter.Params) {
	if !helpers.CheckUser(w, r) {
		return
	}
	post := models.Urun{}.Get(params.ByName("id"))
	title := r.FormValue("urun-title")
	fiyat := r.FormValue("urun-fiyat")
	slug := slug.Make(title)
	description := r.FormValue("urun-desc")
	categoryID, _ := strconv.Atoi(r.FormValue("urun-category"))
	content := r.FormValue("urun-content")
	is_selected := r.FormValue("is_selected")
	is_selected1 := r.FormValue("is_selected1")
	is_selected2 := r.FormValue("is_selected2")
	is_selected3 := r.FormValue("is_selected3")

	var picture_url string

	if is_selected == "1" {
		//Upload
		r.ParseMultipartForm(10 << 20)
		file, header, err := r.FormFile("urun-picture")
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
	var picture_url1 string

	if is_selected1 == "1" {
		//Upload
		r.ParseMultipartForm(10 << 20)
		file1, header1, err := r.FormFile("urun-picture1")
		if err != nil {
			fmt.Println(err)
			return
		}
		f1, err := os.OpenFile("uploads/"+header1.Filename, os.O_WRONLY|os.O_CREATE, 0666)
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err = io.Copy(f1, file1)
		// Upload End
		picture_url1 = "uploads/" + header1.Filename
		os.Remove(post.Picture_url1)
	} else {
		picture_url1 = post.Picture_url1
	}
	var picture_url2 string

	if is_selected2 == "1" {
		//Upload
		r.ParseMultipartForm(10 << 20)
		file2, header2, err := r.FormFile("urun-picture2")
		if err != nil {
			fmt.Println(err)
			return
		}
		f2, err := os.OpenFile("uploads/"+header2.Filename, os.O_WRONLY|os.O_CREATE, 0666)
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err = io.Copy(f2, file2)
		// Upload End
		picture_url2 = "uploads/" + header2.Filename
		os.Remove(post.Picture_url2)
	} else {
		picture_url2 = post.Picture_url2
	}
	var picture_url3 string

	if is_selected3 == "1" {
		//Upload
		r.ParseMultipartForm(10 << 20)
		file3, header3, err := r.FormFile("urun-picture3")
		if err != nil {
			fmt.Println(err)
			return
		}
		f3, err := os.OpenFile("uploads/"+header3.Filename, os.O_WRONLY|os.O_CREATE, 0666)
		if err != nil {
			fmt.Println(err)
			return
		}
		_, err = io.Copy(f3, file3)
		// Upload End
		picture_url3 = "uploads/" + header3.Filename
		os.Remove(post.Picture_url3)
	} else {
		picture_url3 = post.Picture_url3
	}

	post.Updates(models.Urun{
		Title:        title,
		Fiyat:        fiyat,
		Slug:         slug,
		Description:  description,
		CategoryID:   categoryID,
		Content:      content,
		Picture_url:  picture_url,
		Picture_url1: picture_url1,
		Picture_url2: picture_url2,
		Picture_url3: picture_url3,
	})
	http.Redirect(w, r, "/admin/urunedit/"+params.ByName("id"), http.StatusSeeOther)
}
