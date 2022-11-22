package models

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type Urun struct {
	gorm.Model
	Title, Fiyat, Slug, Description, Content, Picture_url, Picture_url1, Picture_url2, Picture_url3 string
	CategoryID                                                                                                                  int
}

func (urun Urun) Migrate() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.AutoMigrate(&urun)
}

func (urun Urun) Add() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Create(&urun)
}

func (urun Urun) Get(where ...interface{}) Urun {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return urun
	}
	db.First(&urun, where...)
	return urun
}

func (urun Urun) GetAll(where ...interface{}) []Urun {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return nil
	}
	var uruns []Urun
	db.Find(&uruns, where...)
	return uruns
}

func (urun Urun) Update(column string, value interface{}) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&urun).Update(column, value)
}

func (urun Urun) Updates(data Urun) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&urun).Updates(data)
}

func (urun Urun) Delete() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Delete(&urun, urun.ID)
}
