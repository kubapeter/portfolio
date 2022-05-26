import java.util.*; 

public class LabChallenge {
  
  //add code below this line

  public static void sayHello(ArrayList<String> nms) {
    for (String name : nms){
      System.out.println("Hello " + name);
    }
  }

  //add code above this line
  
  public static void main(String args[]) {
    ArrayList<String> names = new ArrayList<String>();
    for (String s : args) {
      names.add(s);
    }
    sayHello(names);
  }
  
}
