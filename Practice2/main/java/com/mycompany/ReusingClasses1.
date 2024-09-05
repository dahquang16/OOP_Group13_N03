class MyClass {
    private String message;
    public MyClass(String message) {
        this.message = message;
    }
    public void message() {
        System.out.println(message);
    }
}
pulic class LazyInit{
    private MyClass myClassInstance;

    public MyClass getMyClassInstance() {
        if (myClassInstance == null) {
            myClassInstance = new MyClass("Lazy Init");
        }
        return myClassInstance;
    }
    public static void main(String[] args) {
        LazyInit lazy = new LazyInit();
        MyClass myClass = lazy.getMyClassInstance();
        myClass.message();
    }
}
