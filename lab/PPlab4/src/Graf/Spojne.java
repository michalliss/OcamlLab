package Graf;
import Utils.*;
import Utils.Edge;

import java.util.ArrayList;

public class Spojne {
    public static<W,S> void spojne(IGraf<W,S> graph){

        ArrayList<W> nodeList = new ArrayList<>();
        ArrayList<Edge<W,S>> edgeList = new ArrayList<>();

        for(W w1 : graph.wierzcholki()){
            nodeList.add(w1);
            for(W w2 : graph.krawedzie(w1)){
                edgeList.add(new Edge<>(w1, graph.krawedz(w1, w2), w2));
            }
        }

        DisjointSet<W> ds = new DisjointSet<>();

        for(W w : nodeList){
            ds.makeSet(w);
        }

        for(Edge<W,S> e: edgeList){
            if(!ds.findSet(e.from).equals(ds.findSet(e.to))){
                ds.union(e.from, e.to);
            }
        }

        for(W w : nodeList){
            System.out.println(w + " -> składowa nr: " +ds.findSet(w));
        }
    }
}
