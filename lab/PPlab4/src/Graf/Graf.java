package Graf;

import Utils.Edge;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Graf<W, S> implements IGraf<W, S> {

    private HashMap<W, HashMap<W, S>> adjList;
    private ArrayList<W> list;

    public Graf(ArrayList<W> nodes, ArrayList<Edge<W, S>> edges) {
        this.list = nodes;

        adjList = new HashMap<>();
        for (W node : nodes) {
            adjList.put(node, new HashMap<>());
        }

        for (Edge<W, S> edge : edges) {
            adjList.get(edge.from).put(edge.to, edge.label);
        }
    }


    @Override
    public List<W> wierzcholki() {
        return list;
    }

    @Override
    public S krawedz(W w1, W w2) {
        if (!adjList.containsKey(w1)) return null;

        S label = adjList.get(w1).get(w2);
        return label;
    }

    @Override
    public List<W> krawedzie(W w) {
        if (!adjList.containsKey(w)) return null;

        ArrayList<W> ns = new ArrayList(adjList.get(w).keySet());
        return ns;
    }


}
