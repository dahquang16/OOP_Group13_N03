package com.mycompany.java;

public class App {
	 public static void main(String[] args) {
	        Book myBook = new Book("Quang", "Danh Quang", 68);
	        System.out.println("Book title: " + myBook.title);
	        System.out.println("Author: " + myBook.author);
	        System.out.println("Number Page: " + myBook.numPages);

	        NNCollection collection = new NNCollection();

	        collection.insert(new NameNumber("Quang", "23010230"));
	        collection.insert(new NameNumber("Chi", "23010831"));
	        System.out.println("Quang number: " + collection.findNumber("Quang"));
	        System.out.println("Chi number: " + collection.findNumber("Chi"));

	        Recursion recursion = new Recursion();
	        System.out.println("Factorial: " + recursion.factorial(4));
	        System.out.println("Hello");
	        Time time = new Time(06, 06, 16);
	        System.out.println("Time: " + time.getHour() + ":" + time.getMinute() + ":" + time.getSecond());
	    }
}
