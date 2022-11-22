package models

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type Kurum struct {
	gorm.Model
	Title, Description, Picture_url, Slug string
}

func (kurum Kurum) Migrate() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.AutoMigrate(&kurum)
}

func (kurum Kurum) Add() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Create(&kurum)
}

func (kurum Kurum) Get(where ...interface{}) Kurum {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return kurum
	}
	db.First(&kurum, where...)
	return kurum
}

func (kurum Kurum) GetAll(where ...interface{}) []Kurum {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return nil
	}
	var kurums []Kurum
	db.Find(&kurums, where...)
	return kurums
}

func (kurum Kurum) Update(column string, value interface{}) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&kurum).Update(column, value)
}

func (kurum Kurum) Updates(data Kurum) {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Model(&kurum).Updates(data)
}

func (kurum Kurum) Delete() {
	db, err := gorm.Open(mysql.Open(Dns), &gorm.Config{})
	if err != nil {
		fmt.Println(err)
		return
	}
	db.Delete(&kurum, kurum.ID)
}
