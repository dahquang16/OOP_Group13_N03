
public interface Signal {
    double getValue(double t);
    String getDescription();
}
public class DiscreteSignal implements Signal {
    private double[] values;
    private double samplingInterval;

    public DiscreteSignal(double[] values, double samplingInterval) {
        this.values = values;
        this.samplingInterval = samplingInterval;
    }

    public double getValue(double t) {
        int index = (int) (t / samplingInterval);
        if (index < 0 || index >= values.length) {
            throw new IndexOutOfBoundsException("Time index out of bounds");
        }
        return values[index];
    }

    public String getDescription() {
        return "Discrete Signal with sampling interval of " + samplingInterval;
    }
}
public class ContinuousSignal implements Signal {
    private Function<Double, Double> function;

    public ContinuousSignal(Function<Double, Double> function) {
        this.function = function;
    }

    public double getValue(double t) {
        return function.apply(t);
    }

    public String getDescription() {
        return "Continuous Signal represented by a mathematical function";
    }
}

