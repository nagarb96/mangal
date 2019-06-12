package com.mycompany.ecommproj.model;

public class Product {

    private int id;
    private String name;
    private String description;
    private float price;
    private String categoryName;
    private String imageUrl;

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", categoryName=" + categoryName + ", imageUrl=" + imageUrl + '}';
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Product() {
    }

    public int getImagePath() {
                    throw new UnsupportedOperationException(""); //To change body of generated methods, choose Tools | Templates.
    
    }

    public void setPrice(Float price) {
        this.price = price;
    }
}
