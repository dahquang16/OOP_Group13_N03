import java.util.HashMap;
import java.util.Map;

public class DiscreteSignal implements Signal {
    private Map<Integer, Double> values; 
    private double samplingInterval;


    public DiscreteSignal(Map<Integer, Double> values, double samplingInterval) {
        this.values = values;
        this.samplingInterval = samplingInterval;
    }

    public double getValue(double t) {
 
        int index = (int) Math.round(t / samplingInterval);
        return values.getOrDefault(index, 0.0);
    }

    public String getDescription() {
        return "Discrete Signal with sampling interval of " + samplingInterval;
    }

    public void printSignal() {
        for (Map.Entry<Integer, Double> entry : values.entrySet()) {
            System.out.println("n = " + entry.getKey() + ", x(n) = " + entry.getValue());
        }
    }
}
