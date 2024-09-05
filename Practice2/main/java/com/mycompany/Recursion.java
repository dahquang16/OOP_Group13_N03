package com.mycompany.app;

public class Recursion {

    // Example of a recursive method (calculating factorial)
    public int factorial(int n) {
        if (n == 1) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }
}
