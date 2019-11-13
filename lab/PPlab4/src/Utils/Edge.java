package Utils;

public class Edge<W,S> {
    public W from;
    public S label;
    public W to;

    public Edge(W from, S label, W to) {
        this.from = from;
        this.label = label;
        this.to = to;
    }

    @Override
    public String toString() {
        return label.toString();
    }
}
