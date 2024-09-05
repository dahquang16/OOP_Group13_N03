package com.mycompany.collision;

public class CollisionObject {
    private String name;

    public CollisionObject(String name) {
        this.name = name;
    }

    @Override
    public int hashCode() {
        return 42;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        CollisionObject other = (CollisionObject) obj;
        return name.equals(other.name);
    }

    @Override
    public String toString() {
        return "CollisionObject{name='" + name + "'}";
    }
}
package com.mycompany.app;

import com.mycompany.collision.CollisionObject;

import java.util.HashSet;

public class App {
    public static void main(String[] args) {
   
        HashSet<CollisionObject> set = new HashSet<>();
        CollisionObject obj1 = new CollisionObject("Object 1");
        CollisionObject obj2 = new CollisionObject("Object 2");
        CollisionObject obj3 = new CollisionObject("Object 3");
        set.add(obj1);
        set.add(obj2);
        set.add(obj3);

        System.out.println("HashSet contents:");
        for (CollisionObject obj : set) {
            System.out.println(obj + " - HashCode: " + obj.hashCode());
        }


        System.out.println("Total objects in the set: " + set.size());
    }
}
