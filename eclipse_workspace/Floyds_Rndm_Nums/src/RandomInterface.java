//import java.util.Collection;
import java.util.Iterator;
import java.util.Random;

public interface RandomInterface{
     int nextInt(int bound);

     
     /*static int[] convert(Collection<Integer> list){

        int[] temp = new int[list.size()];
        Iterator<Integer> iterator = list.iterator();

        for(int i =0 ; i < temp.length; i++)
            temp[i] =iterator.next();

        return  temp;
    }*/
}

class RandomStub implements RandomInterface{

    private int pos = 0;
    private int[] arr;

    public RandomStub(int[] arr){
        this.arr = arr;
    }

    @Override
    public int nextInt(int bound){

        while(arr[pos] >bound)
            pos++;

        return arr[pos++];
    }
}

class RandomClass implements  RandomInterface{
    Random r= new Random();

    public int nextInt(int bound){
        return r.nextInt(bound);
    }
}