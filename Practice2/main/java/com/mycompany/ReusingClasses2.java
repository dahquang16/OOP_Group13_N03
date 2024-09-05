public class Detergent {
    public void scrub() {
        System.out.println("Scrubbing");
    }

    public void clean() {
        System.out.println("Cleaning");
    }
}

class AdvancedDetergent extends Detergent {
    public void scrub() {
        System.out.println("Advanced scrubbing");
    }
    public void sterilize() {
        System.out.println("Sterilizing");
    }
}
class Main {
    public static void main(String[] args) {
        Detergent detergent = new Detergent();
        detergent.scrub();
        detergent.clean(); 
        AdvancedDetergent advancedDetergent = new AdvancedDetergent();
        advancedDetergent.scrub();
        advancedDetergent.clean();     
        advancedDetergent.sterilize();
    }
}
