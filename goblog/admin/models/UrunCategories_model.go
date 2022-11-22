package models

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type UrunCategory struct {
	gorm.Model
	Title, Slug string
}

func (uruncategory UrunCategory) Migrate() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.AutoMigrate(&uruncategory)
}

func (uruncategory UrunCategory) Add() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Create(&uruncategory)
}

func (uruncategory UrunCategory) Get(where ...interface{}) UrunCategory {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return uruncategory
	}
	db.First(&uruncategory, where...)
	return uruncategory
}

func (uruncategory UrunCategory) GetAll(where ...interface{}) []UrunCategory {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return nil
	}
	var uruncategories []UrunCategory
	db.Find(&uruncategories, where...)
	return uruncategories
}

func (uruncategory UrunCategory) Update(column string, value interface{}) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&uruncategory).Update(column, value)
}

func (uruncategory UrunCategory) Updates(data UrunCategory) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&uruncategory).Updates(data)
}

func (uruncategory UrunCategory) Delete() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Delete(&uruncategory, uruncategory.ID)
}
