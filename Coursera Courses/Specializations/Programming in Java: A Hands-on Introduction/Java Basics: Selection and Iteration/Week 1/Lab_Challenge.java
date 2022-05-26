public class Lab_Challenge {
  public static void main(String args[]) {
    
    String greeting = args[0];
    String dayOfWeek = args[1];
    String month = args[2];
    int day = Integer.parseInt(args[3]);
    int currentWaitMinutes = Integer.parseInt(args[4]);
    
    //add code below this line
    
    System.out.println(greeting + " Today is " + dayOfWeek +
        ", " + month + " " + day + ".");
     System.out.println("The current wait time is " 
        + currentWaitMinutes +" minutes.");
    
    //add code above this line
  }
}
