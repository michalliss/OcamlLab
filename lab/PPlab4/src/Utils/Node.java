package Utils;

public class Node<T> {
    public Node parent;
    public T data;
    public int rank;

    public Node(T data) {
        this.data = data;
    }
}
