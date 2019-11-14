package Utils;

import java.util.HashMap;

public class DisjointSet<T> {
    HashMap<T, Node<T>> map = new HashMap<>();

    public void makeSet(T x) {
        Node<T> n = new Node(x);
        n.parent = null;
        n.rank = 0;

        map.put(x, n);
    }

    public T findSet(T x) {
        return (T) findSet(map.get(x)).data;
    }

    private Node findSet(Node<T> n) {
        if (n.parent == null) return n;
        return findSet(n.parent);
    }

    public void Link(T a, T b) {
        Node<T> x = map.get(a);
        Node<T> y = map.get(b);

        Link(x, y);
    }

    private void Link(Node x, Node y) {
        if (x.rank > y.rank) {
            y.parent = x;
        } else {
            x.parent = y;
            if (x.rank == y.rank) {
                y.rank = y.rank + 1;
            }
        }
    }

    public void union(T a, T b) {
        Node<T> x = map.get(a);
        Node<T> y = map.get(b);
        Link(findSet(x), findSet(y));
    }
}
