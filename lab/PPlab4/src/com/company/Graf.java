package com.company;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Graf<W, S> implements IGraf<W, S> {

    private class Edge {
        public W from;
        public S label;
        public W to;

        public Edge(W from, S label, W to) {
            this.from = from;
            this.label = label;
            this.to = to;
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

        ArrayList ns = new ArrayList(adjList.get(w).entrySet());
        return ns;
    }


    private HashMap<W, HashMap<W, S>> adjList;
    private ArrayList<W> list;


    public Graf(ArrayList<W> nodes, ArrayList<Edge> edges) {
        this.list = nodes;

        adjList = new HashMap<>();
        for (W node : nodes) {
            adjList.put(node, new HashMap<>());
        }

        for (Edge edge : edges) {
            adjList.get(edge.from).put(edge.to, edge.label);
        }
    }
}
