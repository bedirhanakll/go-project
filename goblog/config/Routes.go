package config

import (
	"github.com/julienschmidt/httprouter"
	admin "goblog/admin/controllers"
	site "goblog/site/controllers"
	"net/http"
)

func Routes() *httprouter.Router {
	r := httprouter.New()
	//ADMIN
	//Blog Posts
	r.GET("/admin", admin.Dashboard{}.Index)
	r.GET("/admin/yeni-ekle", admin.Dashboard{}.NewItem)
	r.POST("/admin/add", admin.Dashboard{}.Add)
	r.GET("/admin/delete/:id", admin.Dashboard{}.Delete)
	r.GET("/admin/edit/:id", admin.Dashboard{}.Edit)
	r.POST("/admin/update/:id", admin.Dashboard{}.Update)

	//İş İlanları

	r.GET("/admin/ilan", admin.Dashboardilan{}.Index)
	r.GET("/admin/ilan-ekle", admin.Dashboardilan{}.NewItem)
	r.POST("/admin/ilanadd", admin.Dashboardilan{}.Add)
	r.GET("/admin/ilandelete/:id", admin.Dashboardilan{}.Delete)
	r.GET("/admin/ilanedit/:id", admin.Dashboardilan{}.Edit)
	r.POST("/admin/ilanupdate/:id", admin.Dashboardilan{}.Update)

	//urun posts

	r.GET("/admin/urunler", admin.Dashboardurun{}.IndexUrun)
	r.GET("/admin/yeni-urun-ekle", admin.Dashboardurun{}.NewItemUrun)
	r.POST("/admin/urunadd", admin.Dashboardurun{}.AddUrun)
	r.GET("/admin/urundelete/:id", admin.Dashboardurun{}.DeleteUrun)
	r.GET("/admin/urunedit/:id", admin.Dashboardurun{}.EditUrun)
	r.POST("/admin/urunupdate/:id", admin.Dashboardurun{}.UpdateUrun)
	//kurumsal
	r.GET("/admin/kurumsal", admin.Dashboardk{}.Index)
	r.GET("/admin/kurumsal-ekle", admin.Dashboardk{}.NewItem)
	r.POST("/admin/kurumsaladd", admin.Dashboardk{}.Add)
	r.GET("/admin/kurumsaldelete/:id", admin.Dashboardk{}.Delete)
	r.GET("/admin/kurumsaledit/:id", admin.Dashboardk{}.Edit)
	r.POST("/admin/kurumsalupdate/:id", admin.Dashboardk{}.Update)



	//Categories
	r.GET("/admin/kategoriler", admin.Categories{}.Index)
	r.POST("/admin/kategoriler/add", admin.Categories{}.Add)
	r.GET("/admin/kategoriler/delete/:id", admin.Categories{}.Delete)
	//UrunCategories
	r.GET("/admin/urunkategoriler", admin.UrunCategories{}.Index)
	r.POST("/admin/urunkategoriler/add", admin.UrunCategories{}.Add)
	r.GET("/admin/urunkategoriler/delete/:id", admin.UrunCategories{}.Delete)

	//Userops
	r.GET("/admin/login", admin.Userops{}.Index)
	r.POST("/admin/do_login", admin.Userops{}.Login)
	r.GET("/admin/logout", admin.Userops{}.Logout)

	//SITE
	//Homepage
	r.GET("/", site.Homepage{}.Index)
	r.GET("/yazilar/:title", site.Homepage{}.Detail)
	r.GET("/blog.html", site.Homepage{}.Blog)
	r.GET("/shop.html", site.Homepage{}.Shop)
	r.GET("/icerik/:title", site.Homepage{}.UrunDetail)
	r.GET("/icerik", site.Homepage{}.Index)
	r.GET("/ilanlar/:title", site.Homepage{}.IlanDetail)
	r.GET("/about.html", site.Homepage{}.Ilan)
	r.GET("/ilanlar", site.Homepage{}.Index)
	r.GET("/kurumsal", site.Homepage{}.Kurumsal)



	// SERVE FILES
	r.ServeFiles("/admin/assets/*filepath", http.Dir("admin/assets"))
	r.ServeFiles("/assets/*filepath", http.Dir("site/assets"))
	r.ServeFiles("/uploads/*filepath", http.Dir("uploads"))
	r.ServeFiles("/admin/uploads/*filepath", http.Dir("uploads"))
	return r
}
