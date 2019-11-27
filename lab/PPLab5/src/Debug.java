import java.lang.reflect.Field;
import java.lang.reflect.Field;

public class Debug {
    public static void fields(Object object) {
        Field[] fields = object.getClass().getDeclaredFields();
        for(Field f : fields){
            try{
                System.out.println(f.getName() + " " + f.getAnnotatedType() + " " + f.get(object));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }

        }
    }
}



