package com.mycompany.app;

public class App {
    public static void main(String[] args) {
        DisruptLecture disruptLecture = new DisruptLecture();
        disruptLecture.disrupt();
        TestArithmetic arithmetic = new TestArithmetic();
        int result = arithmetic.add(5, 10);
        System.out.println("Sum: " + result);
        GlyphTest glyphTest = new GlyphTest();
        glyphTest.draw();
        Transmogrify transmogrify = new Transmogrify();
        transmogrify.transform();
    }
}
