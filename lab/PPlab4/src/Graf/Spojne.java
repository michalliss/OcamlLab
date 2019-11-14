package Graf;

import Utils.*;
import Utils.Edge;

import java.util.ArrayList;
import java.util.HashMap;

public class Spojne {
    public static <W, S> void spojne(IGraf<W, S> graph) {

        ArrayList<W> nodeList = new ArrayList<>();
        ArrayList<Edge<W, S>> edgeList = new ArrayList<>();

        for (W w1 : graph.wierzcholki()) {
            nodeList.add(w1);
            for (W w2 : graph.krawedzie(w1)) {
                edgeList.add(new Edge<>(w1, graph.krawedz(w1, w2), w2));
            }
        }

        DisjointSet<W> ds = new DisjointSet<>();

        for (W w : nodeList) {
            ds.makeSet(w);
        }

        for (Edge<W, S> e : edgeList) {
            if (!ds.findSet(e.from).equals(ds.findSet(e.to))) {
                ds.union(e.from, e.to);
            }
        }

       /* for (W w : nodeList) {
            System.out.println(w + " -> składowa nr: " + ds.findSet(w));
        }
        */

        HashMap<W, ArrayList<W>> skladowe = new HashMap<>();

        for (W w : nodeList) {
            if (skladowe.containsKey(ds.findSet(w))) {
                skladowe.get(ds.findSet(w)).add(w);
            } else {
                skladowe.put(ds.findSet(w), new ArrayList<W>());
                skladowe.get(ds.findSet(w)).add(w);
            }
        }

        for (W w : skladowe.keySet()) {
            System.out.println(skladowe.get(w));
        }
    }
}
