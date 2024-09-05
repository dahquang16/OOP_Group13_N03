package com.mycompany.app;

public class NameNumber {
    private String name;
    private int number;

    public NameNumber(String name, int number) {
        this.name = name;
        this.number = number;
    }

    public void display() {
        System.out.println("Name: " + name + ", Number: " + number);
    }
}
