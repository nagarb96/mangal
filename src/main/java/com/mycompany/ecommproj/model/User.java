package com.mycompany.ecommproj.model;

public class User {
    private String email,username,password,phone;
    private String role="ROLE_USER";
    private boolean active = true;

    @Override
    public String toString() {
        return "User{" + "email=" + email + ", username=" + username + ", password=" + password + ", phone=" + phone + ", role=" + role + ", active=" + active + '}';
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public User() {
        
    }
}
