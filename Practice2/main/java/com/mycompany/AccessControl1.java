
package com.mycompany.vehicles;

public class Car {
    private String make;
    private String model;

    public Car(String make, String model) {
        this.make = make;
        this.model = model;
    }

    public void displayCarInfo() {
        System.out.println("Car Make: " + make);
        System.out.println("Car Model: " + model);
    }
}
package com.mycompany.app;

import com.mycompany.vehicles.Car; 

public class MainApp {
    public static void main(String[] args) {
        Car myCar = new Car("Toyota", "Corolla");
        myCar.displayCarInfo();
    }
}
