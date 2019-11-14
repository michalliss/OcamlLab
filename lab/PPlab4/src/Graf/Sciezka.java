package Graf;

import java.util.ArrayList;


public class Sciezka {

    public static <W, S> boolean sc2(Graf<W, S> graf, W start, W end) {
        System.out.print("Ścieżka z: " + start +" do " + end + ": ");
        ArrayList<W> path = new ArrayList<>();
        path.add(start);
        boolean res =  printPathRec(graf, start, end, new ArrayList<W>(), path);
        if(!res){
            System.out.println("nie istnieje");
        }
        return res;
    }

    private static <W, S> boolean printPathRec(Graf<W, S> graf, W start, W end, ArrayList<W> visited, ArrayList<W> path) {
        visited.add(start);

        if (start.equals(end)) {
            printPath(graf, path);
            return true;
        }

        for (W w : graf.krawedzie(start)) {
            if (!visited.contains(w)) {
                path.add(w);
                if(printPathRec(graf, w, end, visited, path)){
                    return true;
                }
                path.remove(w);
            }
        }
        return false;
    }

    private static <W, S> void printPath(Graf graf, ArrayList<W> path) {
        System.out.print("Start -> ");
        for (int i = 0; i < path.size() - 1; i++) {
            System.out.print(graf.krawedz(path.get(i), path.get(i + 1)) + " -> ");
        }
        System.out.println("End");
    }
}
