package com.company;

import java.util.ArrayList;
import java.util.List;

public class Graf <W,S> implements IGraf<W,S> {
    @Override
    public List<W> wierzcholki() {
        return null;
    }

    @Override
    public S krawedz(W w1, W w2) {
        return null;
    }

    @Override
    public List<W> krawedzie(W w) {
        return null;
    }

    

    private ArrayList<ArrayList<W>> nodes;
}
