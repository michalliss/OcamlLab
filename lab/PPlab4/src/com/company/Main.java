package com.company;
import Graf.*;
import Utils.Edge;

import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {

        ArrayList<Integer> nodes = new ArrayList<>();
        ArrayList<Edge<Integer, String>> edges = new ArrayList<>();

        nodes.add(1);
        nodes.add(2);
        nodes.add(3);
        nodes.add(4);
        nodes.add(5);
        nodes.add(6);
        nodes.add(7);

        edges.add(new Edge<Integer, String>(1,"l1",2));
        edges.add(new Edge<Integer, String>(2,"l2",3));
        edges.add(new Edge<Integer, String>(3,"l3",4));
        edges.add(new Edge<Integer, String>(6,"l4",7));


        Graf<Integer, String> g1 =  new Graf<Integer, String>(nodes, edges);
        Sciezka.sc2(g1, 1, 4);
        Sciezka.sc2(g1, 2, 4);
        Sciezka.sc2(g1, 1, 6);

        System.out.println();

        Spojne.spojne(g1);
    }
}
