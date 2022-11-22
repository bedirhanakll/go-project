package models

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type Ilan struct {
	gorm.Model
	Title, Slug, Description, Content string
}

func (ilan Ilan) Migrate() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.AutoMigrate(&ilan)
}

func (ilan Ilan) Add() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Create(&ilan)
}

func (ilan Ilan) Get(where ...interface{}) Ilan {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return ilan
	}
	db.First(&ilan, where...)
	return ilan
}

func (ilan Ilan) GetAll(where ...interface{}) []Ilan {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return nil
	}
	var ilans []Ilan
	db.Find(&ilans, where...)
	return ilans
}

func (ilan Ilan) Update(column string, value interface{}) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&ilan).Update(column, value)
}

func (ilan Ilan) Updates(data Ilan) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&ilan).Updates(data)
}

func (ilan Ilan) Delete() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Delete(&ilan, ilan.ID)
}
